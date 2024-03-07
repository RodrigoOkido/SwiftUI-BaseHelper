import Foundation

extension Encodable {

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
