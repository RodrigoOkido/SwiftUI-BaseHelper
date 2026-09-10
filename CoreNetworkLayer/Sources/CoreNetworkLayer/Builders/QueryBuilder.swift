//
//  QueryBuilder.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public final class QueryBuilder: Sendable {

    public init() {}

    public func build(parameters: Codable, encoder: JSONEncoder) -> [URLQueryItem] {
        guard let dict = parameters.asDictionary(encoder: encoder) else { return [] }
        return build(parameters: dict)
    }

    public func build(parameters: [String: Any]) -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []

        for (key, value) in parameters {
            if let items = value as? [Any] {
                for item in items {
                    queryItems.append(URLQueryItem(name: key,
                                                   value: String(describing: item)))
                }
            } else {
                queryItems.append(URLQueryItem(name: key,
                                               value: String(describing: value)))
            }
        }
        return queryItems
    }
}
