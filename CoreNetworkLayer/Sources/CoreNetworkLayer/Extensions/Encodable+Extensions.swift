//
//  Encodable+Extensions.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 03/07/25.
//

import Foundation

extension Encodable {

    /// Converts the `Encodable` value into a `[String: Any]` dictionary.
    ///
    /// Encodes `self` to JSON using the given `JSONEncoder`, then deserializes
    /// the resulting `Data` into a dictionary via `JSONSerialization`.
    ///
    /// - Parameter encoder: The encoder used to serialize `self`. It is passed in
    ///   rather than resolved from a container because this package must not depend
    ///   on the app's dependency graph.
    /// - Returns: A `[String: Any]` dictionary representation of the object,
    ///   or `nil` if encoding or deserialization fails.
    ///
    /// - Note: Key names in the output follow whatever `CodingKeys` or encoding
    ///   strategy the given `JSONEncoder` is configured with (e.g. `convertToSnakeCase`).
    ///
    /// - Example:
    ///   ```swift
    ///   struct User: Encodable {
    ///       let id: Int
    ///       let name: String
    ///   }
    ///
    ///   let user = User(id: 1, name: "Rodrigo")
    ///   let dict = user.asDictionary(encoder: JSONEncoder())
    ///   // ["id": 1, "name": "Rodrigo"]
    ///   ```
    func asDictionary(encoder: JSONEncoder) -> [String: Any]? {

        guard let data = try? encoder.encode(self),
              let dictionary = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
              ) as? [String: Any] else {
            return nil
        }

        return dictionary
    }
}
