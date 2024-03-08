import Foundation

class AppDependencies {

    func setup(dependencies: [ModuleDependencies]? = nil) {

        let dependencies = dependencies ?? [CoreModuleDependencies(),
                                            NetworkModuleDependencies(),
                                            MovieDBDependencies()]

        for module in dependencies {
            module.setupDependencies()
        }
    }
}
