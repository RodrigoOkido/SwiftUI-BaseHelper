//
//  CoreModuleDependencies.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//

import Foundation

// MARK: - ModuleDependencies
class CoreModuleDependencies: ModuleDependencies {

    // MARK: - Public Properties
    let factory = DependencyFactory.shared
    var environment: BaseEnvironment?

    // MARK: - Initializers
    init(environment: BaseEnvironment? = nil) {
        self.environment = environment
    }

    func setupDependencies() {

        let environment = self.environment ?? BaseEnvironment()
        factory.register(environment, as: EnvironmentProtocol.self)
    }
}
