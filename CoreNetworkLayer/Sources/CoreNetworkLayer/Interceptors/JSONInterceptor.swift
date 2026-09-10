//
//  JSONInterceptor.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public struct JSONInterceptor: RequestInterceptor {

    public init() {}

    public func adapt(request: URLRequest) -> URLRequest {
        var request = request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
