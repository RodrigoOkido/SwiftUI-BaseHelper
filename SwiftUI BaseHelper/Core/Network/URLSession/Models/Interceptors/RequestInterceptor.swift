//
//  RequestInterceptor.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

public protocol RequestInterceptor {

    func adapt(request: URLRequest) async -> URLRequest
}
