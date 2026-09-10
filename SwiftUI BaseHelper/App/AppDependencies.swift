import Foundation
import CoreNetworkLayer

class AppDependencies {

    func setup(dependencies: [ModuleDependencies]? = nil) {

        let dependencies = dependencies ?? makeDefaultDependencies()

        for module in dependencies {
            module.setupDependencies()
        }
    }
}

// MARK: - Private Methods
private extension AppDependencies {

    /// Builds the default module graph.
    ///
    /// The network stack is composed here instead of being resolved lazily through
    /// `DependencyFactory`, because `CoreNetworkLayer` lives in its own module and cannot see
    /// the app's container. Making the wiring explicit also removes the old ordering trap,
    /// where `CoreNetwork` would crash if it resolved `EnvironmentProtocol` before
    /// `CoreModuleDependencies` had registered it.
    func makeDefaultDependencies() -> [ModuleDependencies] {

        let environment = BaseEnvironment()
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()

        // `CoreModuleDependencies` applies the ISO-8601 strategies to these two instances when
        // it runs, and it runs first in the returned array. `CoreNetwork` holds the same
        // references, so it picks that configuration up before any request is made.
        let coreNetwork = CoreNetwork(configuration: environment,
                                      encoder: encoder,
                                      decoder: decoder)

        let movieDBService = MovieDBRepository(network: coreNetwork,
                                               apiKey: environment.apiKey)

        return [CoreModuleDependencies(encoder: encoder,
                                       decoder: decoder,
                                       environment: environment),
                NetworkModuleDependencies(coreNetwork: coreNetwork,
                                          movieDBService: movieDBService)]
    }
}
