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
    private let requestBuilder = RequestBuilder()

    func request<T, Parameters, E>(endpoint: Endpoint,
                                   method: HTTPVerb,
                                   parameters: Parameters,
                                   responseType: T.Type, errorType: E.Type) async -> RequestResponse<T, E> where T : Decodable, T : Encodable, Parameters : Encodable, E : Decodable, E : Encodable, E : Error {
        return .failure(NetworkRequestError())
    }
    
    func request<T, E>(endpoint: Endpoint, 
                       method: HTTPVerb,
                       responseType: T.Type,
                       errorType: E.Type) async -> RequestResponse<T, E> where T : Decodable, T : Encodable, E : Decodable, E : Encodable, E : Error {
        return .failure(NetworkRequestError())
    }
    
    func request<E>(endpoint: Endpoint, method: HTTPVerb, errorType: E.Type) async -> RequestEmptyResponse<E> where E : Decodable, E : Encodable, E : Error {
        return .failure(NetworkRequestError())

    }
    
    func request<Parameters, E>(endpoint: Endpoint, 
                                method: HTTPVerb,
                                parameters: Parameters,
                                errorType: E.Type) async -> RequestEmptyResponse<E> where Parameters : Encodable, E : Decodable, E : Encodable, E : Error {
        return .failure(NetworkRequestError())

    }
}
