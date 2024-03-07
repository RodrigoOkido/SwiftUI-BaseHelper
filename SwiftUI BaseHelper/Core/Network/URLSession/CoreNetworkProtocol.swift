//
//  CoreNetworkProtocol.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

protocol CoreNetworkProtocol: AnyObject {

    func request<R: Decodable,
                 E: Decodable>(_ parameters: CoreNetworkCodableParameters<R, E>) async -> RequestResponse<R, E>

    func request<R: Decodable,
                 E: Decodable>(_ parameters: CoreNetworkDictionaryParameters<R, E>) async -> RequestResponse<R, E>

    func request<E: Decodable>(endpoint: Endpoint,
                               method: HTTPMethod,
                               parameters: Codable?,
                               interceptors: [RequestInterceptor],
                               errorType: E.Type) async -> SimpleRequestResponse<E>

    func request<E: Decodable>(endpoint: Endpoint,
                               method: HTTPMethod,
                               parameters: [String: Any],
                               interceptors: [RequestInterceptor],
                               errorType: E.Type) async -> SimpleRequestResponse<E>
}
