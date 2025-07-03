//
//  CoreModuleDependencies.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//

import Foundation

// MARK: - ModuleDependencies
class CoreModuleDependencies: ModuleDependencies {

    let factory = DependencyFactory.shared

    // MARK: - Stored Properties
    var encoder: JSONEncoder
    var decoder: JSONDecoder
    var environment: BaseEnvironment?

    // MARK: - Initializers
    init(encoder: JSONEncoder = JSONEncoder(),
         decoder: JSONDecoder = JSONDecoder(),
         environment: BaseEnvironment? = nil) {
        self.encoder = encoder
        self.decoder = decoder
        self.environment = environment
    }

    func setupDependencies() {

        encoder.dateEncodingStrategy = .formatted(.iso8601Full)
        factory.register(encoder, as: JSONEncoder.self)

        decoder.dateDecodingStrategy = .formatted(.iso8601Full)
        factory.register(decoder, as: JSONDecoder.self)

        let environment = self.environment ?? BaseEnvironment()
        factory.register(environment, as: EnvironmentProtocol.self)
    }
}
