//
//  CoreNetwork.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public class CoreNetwork: CoreNetworkProtocol {

    // MARK: - Dependencies
    @Injected var environment: EnvironmentProtocol

    // MARK: - Stored Properties
    private let requestBuilder: RequestBuilder
    private let session: URLSession

    // MARK: - Computed Properties
    var defaultInterceptors: [RequestInterceptor] {
        [JSONInterceptor()]
    }

    public init(requestBuilder: RequestBuilder = RequestBuilder(),
         session: URLSession = URLSession(configuration: .default)) {
        self.requestBuilder = requestBuilder
        self.session = session
    }

    public func request<T, Parameters, E>(endpoint: Endpoint,
                                   method: HTTPVerb,
                                   interceptors: [RequestInterceptor],
                                   parameters: Parameters,
                                   responseType: T.Type,
                                   errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, Parameters : Encodable, E : Codable, E : Error {

        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: parameters.asDictionary() ?? [:],
                                     interceptors: defaultInterceptors + interceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     responseType: responseType,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public func request<T, E>(endpoint: Endpoint,
                       method: HTTPVerb,
                       interceptors: [RequestInterceptor],
                       responseType: T.Type,
                       errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, E : Codable, E : Error {
        
        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: [:],
                                     interceptors: defaultInterceptors + interceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     responseType: responseType,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public func request<E>(endpoint: Endpoint,
                    method: HTTPVerb,
                    interceptors: [RequestInterceptor],
                    errorType: E.Type) async -> RequestEmptyResponse<E> where E : Codable, E : Error {

        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: [:],
                                     interceptors: defaultInterceptors + interceptors)

        switch result {
        case .success(let response):
            return serializeResponse(response: response,
                                     errorType: errorType)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public func request<Parameters, E>(endpoint: Endpoint,
                                method: HTTPVerb,
                                interceptors: [RequestInterceptor],
                                parameters: Parameters,
                                errorType: E.Type) async -> RequestEmptyResponse<E> where Parameters : Encodable, E : Codable, E : Error {
       
        let result = await doRequest(endpoint: endpoint,
                                     method: method,
                                     parameters: parameters.asDictionary() ?? [:],
                                     interceptors: defaultInterceptors + interceptors)

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
                return .failure(NetworkRequestError(statusCode: 400, 
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
        NetworkLogger.log(response: response, 
                          logType: .complete)
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
            return .failure(NetworkRequestError(statusCode: response.statusCode,
                                                error: error.localizedDescription, 
                                                isTokenError: response.statusCode == 401))
        }
    }

    private func serializeResponse<E: Codable & Error>(response: RestResponse,
                                                       errorType: E.Type) -> RequestEmptyResponse<E> {
#if DEBUG
        NetworkLogger.log(response: response,
                          logType: .onlyResponse)
#endif

        let result = response.result(errorType: errorType)

        switch result {
        case .success:
            return .success
        case .failure(let error):
            return .failure(NetworkRequestError(statusCode: response.statusCode,
                                                error: error.localizedDescription,
                                                isTokenError: response.statusCode == 401))
        }
    }
}
