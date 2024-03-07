//
//  CoreNetwork.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

class CoreNetwork: CoreNetworkProtocol {

    // MARK: - Dependencies
    @Injected var environment: EnvironmentProtocol

    // MARK: - Stored Properties
    private let requestBuilder = RequestBuilder()

    let session = URLSession.shared

    // MARK: - Computed Properties
    var defaultInterceptors: [RequestInterceptor] {
        [JSONInterceptor()]
    }
}

// MARK: - Request Response
extension CoreNetwork {

    func request<R, E>(
        _ parameters: CoreNetworkCodableParameters<R, E>
    ) async -> RequestResponse<R, E> where R: Decodable, R: Encodable, E: Decodable, E: Encodable, E: Error {

        let parameters = CoreNetworkDictionaryParameters(
            endpoint: parameters.endpoint,
            method: parameters.method,
            parameters: parameters.parameters?.asDictionary() ?? [:],
            interceptors: parameters.interceptors,
            responseType: parameters.responseType,
            errorType: parameters.errorType
        )
        return await request(parameters)
    }

    func request<R, E>(
        _ parameters: CoreNetworkDictionaryParameters<R, E>
    ) async -> RequestResponse<R, E> where R: Decodable, R: Encodable, E: Decodable, E: Encodable, E: Error {

        let result = await doRequest(endpoint: parameters.endpoint,
                                     method: parameters.method,
                                     parameters: parameters.parameters,
                                     interceptors: defaultInterceptors + parameters.interceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     responseType: parameters.responseType,
                                     errorType: parameters.errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
}

// MARK: - Simple Request Response
extension CoreNetwork {

    func request<E: Decodable>(endpoint: Endpoint,
                               method: HTTPMethod,
                               parameters: Codable?,
                               interceptors: [RequestInterceptor],
                               errorType: E.Type) async -> SimpleRequestResponse<E> {

        return await request(endpoint: endpoint,
                             method: method,
                             parameters: parameters?.asDictionary() ?? [:],
                             interceptors: interceptors,
                             errorType: errorType)
    }

    func request<E: Decodable>(endpoint: Endpoint,
                               method: HTTPMethod,
                               parameters: [String: Any],
                               interceptors: [RequestInterceptor],
                               errorType: E.Type) async -> SimpleRequestResponse<E> {

        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: parameters,
                                     interceptors: defaultInterceptors + interceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(NetworkRequestError(statusCode: error.statusCode))
        }
    }
}

// MARK: - Private Methods
extension CoreNetwork {

    private func doRequest(endpoint: Endpoint,
                           method: HTTPMethod,
                           parameters: [String: Any],
                           interceptors: [RequestInterceptor]) async -> Result<RestResponse, NetworkRequestError> {

        guard let urlRequest = await requestBuilder.makeRequest(host: environment.baseURL,
                                                                path: endpoint.path,
                                                                method: method,
                                                                parameters: parameters,
                                                                interceptors: interceptors) else {
            return .failure(NetworkRequestError(statusCode: 404))
        }

        var dataTask: (data: Data, urlResponse: URLResponse)!

        do {
            dataTask = try await session.data(for: urlRequest)
        } catch let error {
            if let error = error as? URLError,
                error.errorCode == NSURLErrorNotConnectedToInternet {
                return .failure(NetworkRequestError(statusCode: 503))
            } else {
                return .failure(NetworkRequestError(statusCode: 404))
            }
        }

        return .success(RestResponse(request: urlRequest,
                                     dataTask: dataTask))
    }

    private func serializeResponse<T: Decodable,
                                   E: Codable & Error>(response: RestResponse,
                                                       responseType: T.Type,
                                                       errorType: E.Type) -> RequestResponse<T, E> {
#if DEBUG
        NetworkLogger.log(response: response)
#endif

        let result = response.result(modelType: responseType, errorType: errorType)

        switch result {
        case .success(let response):
            guard let typedResponse: T = response as? T else {
                return .failure(NetworkRequestError(statusCode: 404))
            }
            return .success(typedResponse)
        case .failure(let error):

            switch error {
            case is E:
                guard let typedError: E = error as? E else {
                    return .failure(NetworkRequestError(statusCode: 404))
                }
                return .customError(typedError)
            case is NetworkRequestError:
                guard let typedFailure: NetworkRequestError = error as? NetworkRequestError else {
                    return .failure(NetworkRequestError(statusCode: 404))
                }
                return .failure(NetworkRequestError(statusCode: 404))
            default:
                return .failure(NetworkRequestError(statusCode: response.statusCode,
                                                    error: error.localizedDescription))
            }
        }
    }

    private func serializeResponse<E: Codable & Error>(response: RestResponse,
                                                       errorType: E.Type) -> SimpleRequestResponse<E> {
#if DEBUG
        NetworkLogger.log(response: response)
#endif

        let result = response.result(errorType: errorType)

        switch result {
        case .success:
            return .success
        case .failure(let error):

            switch error {
            case is E:
                guard let typedError: E = error as? E else {
                    return .failure(NetworkRequestError(statusCode: 400))
                }
                return .customError(typedError)
            case is RequestError:
                guard let typedFailure: RequestError = error as? RequestError else {
                    return .failure(NetworkRequestError(statusCode: 400))
                }
                return .failure(NetworkRequestError(statusCode: 400))
            default:
                return .failure(NetworkRequestError(statusCode: response.statusCode,
                                                    error: error.localizedDescription))
            }
        }
    }
}
