import Foundation

public class QueryBuilder {
    
    var encoder: JSONCoder

    public init(encoder: JSONCoder = JSONCoder()) {
        self.encoder = encoder
    }

    public func build(parameters: Codable) -> [URLQueryItem] {
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
