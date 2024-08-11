//
//  ContentView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct MainView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("appLanguage") private var appLanguage: AppLanguage = .English

    // MARK: - Stored Properties
    let appDependencies: AppDependencies

    // MARK: - Initializer
    init(appDependencies: AppDependencies = AppDependencies()) {
        self.appDependencies = appDependencies
        self.appDependencies.setup()
    }

    var body: some View {
        TabView {
//            NavigationViewFactory.make(.home)
            NavigationStack {
                BaseView()
            }
            .tabItem {
                Label("Components", systemImage: "rectangle.3.group.fill")
            }
            NavigationStack {
                APIView()
            }
            .tabItem {
                Label("API", systemImage: "network")
            }
            NavigationStack {
                MapView()
            }
            .tabItem {
                Label("Map", systemImage: "map")
            }
            NavigationStack {
                SettingsView(viewModel: SettingsViewModel(language: appLanguage))
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .environment(\.locale, .init(identifier: appLanguage.langCode))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    MainView()
}


//
//  RentersCoordinator.swift
//  Kanguro
//
//  Created by Mateus Vagner on 25/04/24.
//

//import Foundation
//import SwiftUI
//
//class RentersCoordinator: Coordinator {
//
//    private let network: NetworkProtocol
//    private let router: RentersRouter<RentersPage>
//    private let policies: [RenterPolicy]
//
//    init(
//        policies: [RenterPolicy],
//        router: RentersRouter<RentersPage>,
//        navigation: UINavigationController,
//        network: NetworkProtocol
//    ) {
//        self.network = network
//        self.router = router
//        self.policies = policies
//
//        super.init(navigation: navigation)
//    }
//
//    override func start() {
//        let tabRenters = if !policies.isEmpty {
//            RentersNavigationViewFactory.make(
//                page: .rentersDashboard(renterPolicies: policies),
//                network: network,
//                router: router
//            )
//        } else {
//            RentersNavigationViewFactory.make(
//                page: .rentersUpselling,
//                network: network,
//                router: router
//            )
//        }
//
//        let rentersView = UIHostingController(rootView: tabRenters)
//
//        navigation.isNavigationBarHidden = true
//        navigation.pushViewController(rentersView, animated: false)
//    }
//
//    override func backToRoot() {
//        router.popToRoot()
//    }
//}
