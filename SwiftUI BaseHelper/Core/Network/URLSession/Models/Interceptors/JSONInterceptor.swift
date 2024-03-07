//
//  JSONInterceptor.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

struct JSONInterceptor: RequestInterceptor {

    func adapt(request: URLRequest) -> URLRequest {
        var request = request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
