import Foundation

public class BodyBuilder {
    
    var encoder: JSONCoder

    public init(encoder: JSONCoder = JSONCoder()) {
        self.encoder = encoder
    }
    
    func build(parameters: Codable) -> Data? {
        guard let dict = parameters.asDictionary(encoder: encoder) else { return nil }
        return build(parameters: dict)
    }

    func build(parameters: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: parameters, 
                                           options: .prettyPrinted)
    }
}
