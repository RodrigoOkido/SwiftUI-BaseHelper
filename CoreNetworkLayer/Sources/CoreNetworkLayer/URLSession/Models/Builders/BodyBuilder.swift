import Foundation

public class BodyBuilder {

    public init() {}

    func build(parameters: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: parameters, 
                                           options: .prettyPrinted)
    }
}
