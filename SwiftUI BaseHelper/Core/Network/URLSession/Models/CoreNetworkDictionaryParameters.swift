//
//  CoreNetworkDictionaryParameters.swift
//  Base
//
//  Created by Fernando Goulart on 2/5/24.
//

import Foundation

struct CoreNetworkDictionaryParameters<R: Decodable, E: Decodable> {
    let endpoint: Endpoint
    let method: HTTPMethod
    let parameters: [String: Any]
    let interceptors: [RequestInterceptor]
    let responseType: R.Type
    let errorType: E.Type
}
