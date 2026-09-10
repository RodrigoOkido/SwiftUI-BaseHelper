//
//  RequestBuilder.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public final class RequestBuilder: Sendable {

    let queryBuilder: QueryBuilder
    let bodyBuilder: BodyBuilder
    let interceptorBuilder: InterceptorBuilder

    public init(queryBuilder: QueryBuilder = QueryBuilder(),
         bodyBuilder: BodyBuilder = BodyBuilder(),
         interceptorBuilder: InterceptorBuilder = InterceptorBuilder()) {
        self.queryBuilder = queryBuilder
        self.bodyBuilder = bodyBuilder
        self.interceptorBuilder = interceptorBuilder
    }
}

// MARK: - Methods
extension RequestBuilder {

    public func makeRequest(host: String,
                            path: String,
                            method: HTTPVerb,
                            parameters: Codable?,
                            encoder: JSONEncoder,
                            interceptors: [RequestInterceptor]) async -> URLRequest? {

        return await makeRequest(host: host,
                           path: path,
                           method: method,
                           parameters: parameters?.asDictionary(encoder: encoder) ?? [:],
                           interceptors: interceptors)
    }

    public func makeRequest(host: String,
                            path: String,
                            method: HTTPVerb,
                            parameters: [String: Any],
                            interceptors: [RequestInterceptor]) async -> URLRequest? {

        var urlComponents = URLComponents(string: host) ?? URLComponents()
        urlComponents.path = path

        if method.shouldUseQuery {
            urlComponents.queryItems = queryBuilder.build(parameters: parameters)
        }

        guard let url = urlComponents.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if method.shouldUseBody {
            request.httpBody = bodyBuilder.build(parameters: parameters)
        }

        request = await interceptorBuilder.adapt(urlRequest: request,
                                                 interceptors: interceptors)

        return request
    }
}
