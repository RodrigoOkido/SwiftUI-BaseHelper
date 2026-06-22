//
//  NetworkModuleDependencies.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//
import Foundation

class NetworkModuleDependencies: ModuleDependencies {

    // MARK: - Public Properties
    let factory = DependencyFactory.shared
    let coreNetwork: CoreNetworkProtocol
    let movieDBService: MovieDBRepositoryProtocol

    // MARK: - Initializers
    init(coreNetwork: CoreNetworkProtocol = CoreNetwork(),
         movieDBService: MovieDBRepositoryProtocol = MovieDBRepository()) {
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
