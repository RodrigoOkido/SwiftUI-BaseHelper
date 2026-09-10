//
//  NetworkModuleDependencies.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//
import Foundation
import CoreNetworkLayer

class NetworkModuleDependencies: ModuleDependencies {

    // MARK: - Public Properties
    let factory = DependencyFactory.shared
    let coreNetwork: CoreNetworkProtocol
    let movieDBService: MovieDBRepositoryProtocol

    // MARK: - Initializers
    /// - Note: There are no default arguments here on purpose. `CoreNetworkLayer` cannot read
    ///   the app's `DependencyFactory`, so a network stack can only be built by handing it a
    ///   `NetworkConfiguration`. Composing it is `AppDependencies`' job.
    init(coreNetwork: CoreNetworkProtocol,
         movieDBService: MovieDBRepositoryProtocol) {
        self.coreNetwork = coreNetwork
        self.movieDBService = movieDBService
    }
}

// MARK: - Setup
extension NetworkModuleDependencies {

    func setupDependencies() {
        factory.register(coreNetwork, as: CoreNetworkProtocol.self)
        factory.register(movieDBService, as: MovieDBRepositoryProtocol.self)
    }
}
