//
//  BodyBuilder.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public final class BodyBuilder: Sendable {

    public init() {}

    public func build(parameters: Codable, encoder: JSONEncoder) -> Data? {
        guard let dict = parameters.asDictionary(encoder: encoder) else { return nil }
        return build(parameters: dict)
    }

    public func build(parameters: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: parameters,
                                           options: .prettyPrinted)
    }
}
