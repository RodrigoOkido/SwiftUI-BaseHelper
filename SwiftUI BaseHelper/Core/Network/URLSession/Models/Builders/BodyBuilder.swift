//
//  BodyBuilder.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

class BodyBuilder {

    func build(parameters: Codable) -> Data? {
        guard let dict = parameters.asDictionary() else { return nil }
        return build(parameters: dict)
    }

    func build(parameters: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
    }
}
