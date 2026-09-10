//
//  NetworkMock.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 13/03/24.
//

import Foundation
import CoreNetworkLayer
@testable import SwiftUI_BaseHelper

/// Call-counting spy for `CoreNetworkProtocol`.
///
/// A generic mock cannot fabricate a value of an arbitrary `T`, so every overload records the
/// call and reports a failure. Tests that need a populated success path stub the repository
/// instead (see `MockMovieDBRepository`).
///
/// - Note: `@unchecked Sendable` because `requestsCounter` is mutable. Test doubles are driven
///   from a single test task, so no synchronisation is added here.
final class NetworkMock: CoreNetworkProtocol, @unchecked Sendable {

    // MARK: - Public Properties
    var requestsCounter: Int

    // MARK: - Initializer
    init(requestsCounter: Int = 0) {
        self.requestsCounter = requestsCounter
    }

    func request<T, Parameters, E>(endpoint: Endpoint,
                                   method: HTTPVerb,
                                   interceptors: [RequestInterceptor],
                                   parameters: Parameters,
                                   responseType: T.Type,
                                   errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, Parameters : Encodable, E : Codable, E : Error {

        requestsCounter += 1
        return .failure(notStubbedError)
    }

    func request<Parameters, E>(endpoint: Endpoint,
                                method: HTTPVerb,
                                interceptors: [RequestInterceptor],
                                parameters: Parameters,
                                errorType: E.Type) async -> RequestEmptyResponse<E> where Parameters : Encodable, E : Codable, E : Error {

        requestsCounter += 1
        return .failure(notStubbedError)
    }

    func request<T, E>(endpoint: Endpoint,
                       method: HTTPVerb,
                       interceptors: [RequestInterceptor],
                       responseType: T.Type,
                       errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, E : Codable, E : Error {

        requestsCounter += 1
        return .failure(notStubbedError)
    }

    func request<E>(endpoint: Endpoint,
                    method: HTTPVerb,
                    interceptors: [RequestInterceptor],
                    errorType: E.Type) async -> RequestEmptyResponse<E> where E : Codable, E : Error {

        requestsCounter += 1
        return .failure(notStubbedError)
    }
}

// MARK: - Helpers
extension NetworkMock {

    private var notStubbedError: NetworkRequestError {
        NetworkRequestError(statusCode: 501,
                            error: "NetworkMock has no stubbed response for this request.")
    }
}
