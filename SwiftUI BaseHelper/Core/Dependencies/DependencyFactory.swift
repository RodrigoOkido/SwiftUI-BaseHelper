import Foundation

class DependencyFactory {

    var dict: [Int: AnyObject] = [:]

    static var shared: DependencyFactory = {
        let instance = DependencyFactory()
        return instance
    }()

    private init() {}

    /// Register a class for the given protocol
    /// - Parameters:
    ///   - class: Class to be registered
    ///   - protocol: Protocol to be the key
    func register<T>(_ class: T, as protocol: T.Type) {
        let key = Int(bitPattern: ObjectIdentifier(`protocol`.self))
        dict[key] = `class` as AnyObject
    }

    /// Returns the registered class if exists
    /// - Parameter protocol: The expected class protocol
    /// - Returns: Returns the registered class if exists
    func resolve<T>(protocol: T.Type) -> T? {
        let key = Int(bitPattern: ObjectIdentifier(`protocol`.self))
        return dict[key] as? T
    }

    /// Returns the registered class or the optional result if there is no registered class for the given protocol
    /// - Parameters:
    ///   - protocol: The expected class protocol
    ///   - optionalResult: The optinal result in case there is no registered class for the given protocol
    /// - Returns: Returns the registered class or the optional result if no registered class for the given protocol
    func resolve<T>(protocol: T.Type, optionalResult: T) -> T {
        return resolve(protocol: `protocol`) ?? optionalResult
    }

    func clear() {
        dict = [:]
    }
}
