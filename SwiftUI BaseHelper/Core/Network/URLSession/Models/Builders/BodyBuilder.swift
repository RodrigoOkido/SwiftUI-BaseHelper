import Foundation

public class BodyBuilder {

    public init() {}
    
    func build(parameters: Codable) -> Data? {
        guard let dict = parameters.asDictionary() else { return nil }
        return build(parameters: dict)
    }

    func build(parameters: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: parameters, 
                                           options: .prettyPrinted)
    }
}
