import Foundation

class BaseEnvironment: EnvironmentProtocol {

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
