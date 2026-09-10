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

    func makeDefaultDependencies() -> [ModuleDependencies] {

        let environment = BaseEnvironment()
        let coreNetwork = CoreNetwork(baseURL: environment.baseURL)
        let movieDBService = MovieDBRepository(network: coreNetwork)

        return [CoreModuleDependencies(environment: environment),
                NetworkModuleDependencies(coreNetwork: coreNetwork,
                                          movieDBService: movieDBService)]
    }
}
