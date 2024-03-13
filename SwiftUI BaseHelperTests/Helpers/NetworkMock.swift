//
//  NetworkMock.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 13/03/24.
//

import Foundation
@testable import SwiftUI_BaseHelper

final class NetworkMock: CoreNetworkProtocol {

    func request<T, Parameters, E>(endpoint: Endpoint,
                                   method: HTTPVerb,
                                   interceptors: [RequestInterceptor],
                                   parameters: Parameters,
                                   responseType: T.Type,
                                   errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, Parameters : Encodable, E : Codable, E : Error {
        
        let result: RequestResponse<T, E> = mockResult(response: (T.self as? Any as! T), 
                                                       error: (E.self as? Any as! E))
        switch result {

        case .success(_):
            return .success(T.self as! T)
        case .failure(_), .customError(_):
            return .failure(E.self as! E as! NetworkRequestError)
        }
    }
    
    func request<Parameters, E>(endpoint: Endpoint,
                                method: HTTPVerb,
                                interceptors: [RequestInterceptor],
                                parameters: Parameters,
                                errorType: E.Type) async -> RequestEmptyResponse<E> where Parameters : Encodable, E : Codable, E : Error {
       
        let result: RequestEmptyResponse<E> = mockEmptyResult(error: (E.self as? Any as! E))

        switch result {
        case .success:
            return .success
        case .failure(_), .customError(_):
            return .failure(E.self as! E as! NetworkRequestError)
        }
    }
    
    func request<T, E>(endpoint: Endpoint,
                       method: HTTPVerb,
                       interceptors: [RequestInterceptor],
                       responseType: T.Type,
                       errorType: E.Type) async -> RequestResponse<T, E> where T : Codable, E : Codable, E : Error {

        let result: RequestResponse<T, E> = mockResult(response: (T.self as? Any as! T),
                                                       error: (E.self as? Any as! E))
        switch result {

        case .success(_):
            return .success(T.self as! T)
        case .failure(_), .customError(_):
            return .failure(E.self as! E as! NetworkRequestError)
        }
    }
    
    func request<E>(endpoint: Endpoint,
                    method: HTTPVerb,
                    interceptors: [RequestInterceptor],
                    errorType: E.Type) async -> RequestEmptyResponse<E> where E : Codable, E : Error {

        let result: RequestEmptyResponse<E> = mockEmptyResult(error: (E.self as? Any as! E))

        switch result {
        case .success:
            return .success
        case .failure(_), .customError(_):
            return .failure(E.self as! E as! NetworkRequestError)
        }
    }

    func mockResult<T, E>(response: T?, error: E?) -> RequestResponse<T, E> where T : Codable, E : Codable, E : Error {

        if let response = response {
            return .success(response)
        } else if let error = error {
            return .failure(error as! NetworkRequestError)
        } else {
            fatalError("Both response and error are nil.")
        }
    }

    func mockEmptyResult<E>(error: E?) -> RequestEmptyResponse<E> where E : Codable, E : Error {

        if let error = error {
            return .failure(error as! NetworkRequestError)
        } else {
            return .success
        }
    }
}
