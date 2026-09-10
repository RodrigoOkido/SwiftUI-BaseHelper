import Foundation
import CoreNetworkLayer

/// - Note: `nonisolated` because the target defaults every type to `@MainActor`, and reading
///   `Bundle.main.infoDictionary` needs no such isolation. `CoreNetworkLayer` reads `baseURL`
///   off the main actor, so an isolated conformance would not be safe to hand over.
nonisolated final class BaseEnvironment: EnvironmentProtocol {

    var infoDictionary: [String: Any] {
        return Bundle.main.infoDictionary ?? [:]
    }

    var baseURL: String {
        guard let scheme = infoDictionary["HTTP_SCHEME"] as? String,
              let url = infoDictionary["BASE_URL"] as? String else { return "" }

        return scheme.appending("://").appending(url)
    }

    var apiKey: String {
        return infoDictionary["API_KEY"] as? String ?? ""
    }

    var publicKey: String {
        return infoDictionary["PUBLIC_KEY"] as? String ?? ""
    }

    var privateKey: String {
        return infoDictionary["PRIVATE_KEY"] as? String ?? ""
    }
    
    func getValue(forKey: String) -> String {
        return infoDictionary[forKey] as? String ?? ""
    }
}

// MARK: - CoreNetworkLayer
/// `baseURL` already satisfies the package's requirement, so the network layer can be fed
/// straight from the app environment without CoreNetworkLayer knowing anything about
/// `Bundle`, xcconfig keys, or the dependency factory.
extension BaseEnvironment: NetworkConfiguration {}
