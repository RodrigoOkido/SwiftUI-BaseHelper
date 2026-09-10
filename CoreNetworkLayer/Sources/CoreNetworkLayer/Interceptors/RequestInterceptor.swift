//
//  RequestInterceptor.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public protocol RequestInterceptor: Sendable {

    func adapt(request: URLRequest) async -> URLRequest
}
