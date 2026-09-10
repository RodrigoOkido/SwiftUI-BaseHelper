import Foundation

public class QueryBuilder {

    public init() {}

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
