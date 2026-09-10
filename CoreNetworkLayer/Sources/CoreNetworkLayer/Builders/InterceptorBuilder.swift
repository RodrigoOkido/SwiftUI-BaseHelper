//
//  InterceptorBuilder.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public final class InterceptorBuilder: Sendable {

    public init() {}

    public func adapt(urlRequest: URLRequest,
                      interceptors: [RequestInterceptor]) async -> URLRequest {

        var urlRequest = urlRequest

        for index in 0..<interceptors.count {
            urlRequest = await interceptors[index].adapt(request: urlRequest)
        }

        return urlRequest
    }
}
