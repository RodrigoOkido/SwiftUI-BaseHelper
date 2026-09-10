//
//  CoreNetworkProtocol.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public protocol CoreNetworkProtocol: AnyObject, Sendable {

    // MARK: - Request with Parameters
    func request<T: Codable,
                 Parameters: Encodable,
                 E: Codable & Error>(endpoint: Endpoint,
                                     method: HTTPVerb,
                                     interceptors: [RequestInterceptor],
                                     parameters: Parameters,
                                     responseType: T.Type,
                                     errorType: E.Type) async -> RequestResponse<T, E>

    func request<Parameters: Encodable,
                 E: Codable & Error>(endpoint: Endpoint,
                                     method: HTTPVerb,
                                     interceptors: [RequestInterceptor],
                                     parameters: Parameters,
                                     errorType: E.Type) async -> RequestEmptyResponse<E>

    // MARK: - Request without Parameters
    func request<T: Codable,
                 E: Codable & Error>(endpoint: Endpoint,
                                     method: HTTPVerb,
                                     interceptors: [RequestInterceptor],
                                     responseType: T.Type,
                                     errorType: E.Type) async -> RequestResponse<T, E>

    func request<E: Codable & Error>(endpoint: Endpoint,
                                     method: HTTPVerb,
                                     interceptors: [RequestInterceptor],
                                     errorType: E.Type) async -> RequestEmptyResponse<E>
}
