//
//  InterceptorBuilder.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

class InterceptorBuilder {

    func adapt(urlRequest: URLRequest, interceptors: [RequestInterceptor]) async -> URLRequest {

        var urlRequest = urlRequest

        for index in 0..<interceptors.count {
            urlRequest = await interceptors[index].adapt(request: urlRequest)
        }

        return urlRequest
    }
}
