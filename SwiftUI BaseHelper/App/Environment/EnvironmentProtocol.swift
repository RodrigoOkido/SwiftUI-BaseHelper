//
//  EnvironmentProtocol.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/03/24.
//

import Foundation

/// - Note: `nonisolated` because the target defaults every type to `@MainActor`. Everything
///   here reads `Bundle.main.infoDictionary`, which needs no isolation, and the network layer
///   reads these values off the main actor.
nonisolated protocol EnvironmentProtocol: AnyObject {

    var infoDictionary: [String: Any] { get }
    var baseURL: String { get }
    var apiKey: String { get }
    var publicKey: String { get }
    var privateKey: String { get }
    
    // MARK: - Functions
    func getValue(forKey key: String) -> String
}
