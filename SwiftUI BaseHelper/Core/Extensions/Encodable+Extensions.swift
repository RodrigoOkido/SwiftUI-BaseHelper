import Foundation

extension Encodable {

    /// Converts the `Encodable` value into a `[String: Any]` dictionary.
    ///
    /// Encodes `self` to JSON using the injected `JSONEncoder`, then deserializes
    /// the resulting `Data` into a dictionary via `JSONSerialization`.
    ///
    /// - Returns: A `[String: Any]` dictionary representation of the object,
    ///   or `nil` if encoding or deserialization fails.
    ///
    /// - Note: Key names in the output follow whatever `CodingKeys` or encoding
    ///   strategy the injected `JSONEncoder` is configured with (e.g. `convertToSnakeCase`).
    ///
    /// - Example:
    ///   ```swift
    ///   struct User: Encodable {
    ///       let id: Int
    ///       let name: String
    ///   }
    ///
    ///   let user = User(id: 1, name: "Rodrigo")
    ///   let dict = user.asDictionary()
    ///   // ["id": 1, "name": "Rodrigo"]
    ///   ```
    func asDictionary() -> [String: Any]? {

        @Injected var encoder: JSONEncoder

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
