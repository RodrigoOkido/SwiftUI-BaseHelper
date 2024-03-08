//
//  CoreNetwork.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

class CoreNetwork: CoreNetworkProtocol {

    // MARK: - Dependencies
    @Injected var environment: EnvironmentProtocol

    // MARK: - Stored Properties
    private let requestBuilder: RequestBuilder
    private let session: URLSession

    // MARK: - Computed Properties
    var defaultInterceptors: [RequestInterceptor] {
        [JSONInterceptor()]
    }

    init(requestBuilder: RequestBuilder = RequestBuilder(),
         session: URLSession = URLSession.shared) {
        self.requestBuilder = requestBuilder
        self.session = session
    }

    func request<T, Parameters, E>(endpoint: Endpoint,
                                   method: HTTPVerb,
                                   parameters: Parameters,
                                   responseType: T.Type, 
                                   errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, Parameters : Encodable, E : Codable, E : Error {

        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: parameters.asDictionary() ?? [:],
                                     interceptors: defaultInterceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     responseType: responseType,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func request<T, E>(endpoint: Endpoint, 
                       method: HTTPVerb,
                       responseType: T.Type,
                       errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, E : Codable, E : Error {
        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: [:],
                                     interceptors: defaultInterceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     responseType: responseType,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func request<E>(endpoint: Endpoint, 
                    method: HTTPVerb,
                    errorType: E.Type) async -> RequestEmptyResponse<E> where E : Codable, E : Error {
        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: [:],
                                     interceptors: defaultInterceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func request<Parameters, E>(endpoint: Endpoint, 
                                method: HTTPVerb,
                                parameters: Parameters,
                                errorType: E.Type) async -> RequestEmptyResponse<E> where Parameters : Encodable, E : Codable, E : Error {
       
        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: parameters.asDictionary() ?? [:],
                                     interceptors: defaultInterceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
}

// MARK: - Private Methods
extension CoreNetwork {

    private func doRequest(endpoint: Endpoint,
                           method: HTTPVerb,
                           parameters: [String: Any],
                           interceptors: [RequestInterceptor]) async -> Result<RestResponse, NetworkRequestError> {

        // URL build
        guard let urlRequest = await requestBuilder.makeRequest(host: environment.baseURL,
                                                                path: endpoint.path,
                                                                method: method,
                                                                parameters: parameters,
                                                                interceptors: interceptors) else {
            return .failure(NetworkRequestError(statusCode: 500, 
                                                error: "Internal Error Request"))
        }

        var dataResponse: (data: Data, urlResponse: URLResponse)

        // Fetch request
        do {
            dataResponse = try await session.data(for: urlRequest)
        } catch let error {
            if let error = error as? URLError,
                error.errorCode == NSURLErrorNotConnectedToInternet {
                return .failure(NetworkRequestError(statusCode: 503, 
                                                    error: "Service Unavailable. No connection detected"))
            } else {
                return .failure(NetworkRequestError(statusCode: 500, 
                                                    error: "Internal Error Request"))
            }
        }

        return .success(RestResponse(request: urlRequest,
                                     dataResponse: dataResponse))
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
                return .failure(NetworkRequestError(statusCode: 400, 
                                                    error: "Could not map. Bad request"))
            }
            return .success(typedResponse)
        case .failure(let error):

            switch error {
            case is E:
                guard let typedError: E = error as? E else {
                    return .failure(NetworkRequestError(statusCode: 400, 
                                                        error: "Could not map. Bad request"))
                }
                return .customError(typedError)
            case is RequestError:
                guard let typedFailure: NetworkRequestError = error as? NetworkRequestError else {
                    return .failure(NetworkRequestError(statusCode: 400, 
                                                        error: "Could not map. Bad request"))
                }
                return .failure(typedFailure)
            default:
                return .failure(NetworkRequestError(statusCode: response.statusCode, 
                                                    error: error.localizedDescription))
            }
        }
    }

    private func serializeResponse<E: Codable & Error>(response: RestResponse,
                                                       errorType: E.Type) -> RequestEmptyResponse<E> {
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
                    return .failure(NetworkRequestError(statusCode: 400, 
                                                        error: "Could not map. Bad request"))
                }
                return .customError(typedError)
            case is RequestError:
                guard let typedFailure: NetworkRequestError = error as? NetworkRequestError else {
                    return .failure(NetworkRequestError(statusCode: 400, 
                                                        error: "Could not map. Bad request"))
                }
                return .failure(typedFailure)
            default:
                return .failure(NetworkRequestError(statusCode: response.statusCode, 
                                                    error: error.localizedDescription))
            }
        }
    }
}
