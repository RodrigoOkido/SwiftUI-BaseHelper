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
    private let appDependencies: AppDependencies
    private let componentsRouter: Router<DestinationView> = Router<DestinationView>()
    private let apiRouter: Router<DestinationView> = Router<DestinationView>()
    private let swiftDataRouter: Router<DestinationView> = Router<DestinationView>()
    private let mapRouter: Router<DestinationView> = Router<DestinationView>()
    private let settingsRouter: Router<DestinationView> = Router<DestinationView>()
    
    @State private var storeModel = StoreModel()

    // MARK: - Initializer
    init(appDependencies: AppDependencies = AppDependencies()) {
        self.appDependencies = appDependencies
        self.appDependencies.setup()
        registerCustomFonts()
    }

    var body: some View {
        TabView {
            // Creates independent Navigation for each tab.
            NavigationViewFactory.make(.home, router: componentsRouter)
                .tabItem {
                    Label("Components", systemImage: "rectangle.3.group.fill")
                }
            NavigationViewFactory.make(.movies, router: apiRouter)
                .tabItem {
                    Label("API", systemImage: "network")
                }
            NavigationViewFactory.make(.swiftData, router: swiftDataRouter)
                .tabItem {
                    Label("SwiftData", systemImage: "swiftdata")
                }
            NavigationViewFactory.make(.map, router: mapRouter)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            NavigationViewFactory.make(.settings(appLanguage: appLanguage), router: settingsRouter)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .environment(\.locale, .init(identifier: appLanguage.langCode))
        .environment(storeModel)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

extension MainView {
    
    private func registerCustomFonts() {
        do {
            try OpenSans.registerFont()
        } catch(let error) {
            print(error)
        }
    }
}

#Preview {
    MainView()
}
