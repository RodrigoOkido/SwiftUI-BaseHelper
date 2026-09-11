//
//  NetworkMock.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 13/03/24.
//

import Foundation
import CoreNetworkLayer
@testable import SwiftUI_BaseHelper

/// Configurable stand-in for `CoreNetworkProtocol`.
///
/// Tests decide the outcome up front through `stubbedJSON` / `stubbedError`; the mock decodes the
/// stubbed payload into whatever `T` the caller asks for, so the real repository code runs end to
/// end without touching the network. Every call is recorded for assertions.
nonisolated final class NetworkMock: CoreNetworkProtocol {

    // MARK: - Private Properties
    private let jsonCoder = JSONCoder()

    // MARK: - Public Properties
    var stubbedJSON: Data?
    var stubbedError: NetworkRequestError?

    private(set) var requestsCounter = 0
    private(set) var lastEndpointPath: String?
    private(set) var lastMethod: HTTPVerb?
    private(set) var lastInterceptors: [RequestInterceptor] = []

    // MARK: - Initializer
    init() {}

    func request<T, Parameters, E>(endpoint: Endpoint,
                                   method: HTTPVerb,
                                   interceptors: [RequestInterceptor],
                                   parameters: Parameters,
                                   responseType: T.Type,
                                   errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, Parameters : Encodable, E : Codable, E : Error {

        record(endpoint: endpoint, method: method, interceptors: interceptors)
        return mockResult()
    }

    func request<Parameters, E>(endpoint: Endpoint,
                                method: HTTPVerb,
                                interceptors: [RequestInterceptor],
                                parameters: Parameters,
                                errorType: E.Type) async -> RequestEmptyResponse<E> where Parameters : Encodable, E : Codable, E : Error {

        record(endpoint: endpoint, method: method, interceptors: interceptors)
        return mockEmptyResult()
    }

    func request<T, E>(endpoint: Endpoint,
                       method: HTTPVerb,
                       interceptors: [RequestInterceptor],
                       responseType: T.Type,
                       errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, E : Codable, E : Error {

        record(endpoint: endpoint, method: method, interceptors: interceptors)
        return mockResult()
    }

    func request<E>(endpoint: Endpoint,
                    method: HTTPVerb,
                    interceptors: [RequestInterceptor],
                    errorType: E.Type) async -> RequestEmptyResponse<E> where E : Codable, E : Error {

        record(endpoint: endpoint, method: method, interceptors: interceptors)
        return mockEmptyResult()
    }
}

// MARK: - Result Mocks
nonisolated extension NetworkMock {

    func mockResult<T, E>() -> RequestResponse<T, E> where T : Codable, E : Codable, E : Error {

        if let stubbedError {
            return .failure(stubbedError)
        }

        guard let stubbedJSON else {
            return .failure(NetworkRequestError(statusCode: 501,
                                                error: "NetworkMock: no stubbedJSON or stubbedError set."))
        }

        do {
            return .success(try jsonCoder.decode(T.self, from: stubbedJSON))
        } catch {
            return .failure(NetworkRequestError(statusCode: 501,
                                                error: "NetworkMock: stubbedJSON does not decode as \(T.self)."))
        }
    }

    func mockEmptyResult<E>() -> RequestEmptyResponse<E> where E : Codable, E : Error {

        if let stubbedError {
            return .failure(stubbedError)
        }
        return .success
    }
}

// MARK: - Private Methods
nonisolated private extension NetworkMock {

    func record(endpoint: Endpoint, method: HTTPVerb, interceptors: [RequestInterceptor]) {
        requestsCounter += 1
        lastEndpointPath = endpoint.path
        lastMethod = method
        lastInterceptors = interceptors
    }
}
