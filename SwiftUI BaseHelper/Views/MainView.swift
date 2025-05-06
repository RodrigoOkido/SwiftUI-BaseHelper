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
    let router: Router<DestinationView> = Router<DestinationView>()
    let router2: Router<DestinationView> = Router<DestinationView>()
    let router3: Router<DestinationView> = Router<DestinationView>()
    let router4: Router<DestinationView> = Router<DestinationView>()
    
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
            NavigationViewFactory.make(.home, router: router)
                .tabItem {
                    Label("Components", systemImage: "rectangle.3.group.fill")
                }
            NavigationViewFactory.make(.movies, router: router2)
                .tabItem {
                    Label("API", systemImage: "network")
                }
            NavigationViewFactory.make(.map, router: router3)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            NavigationViewFactory.make(.settings(appLanguage: appLanguage), router: router4)
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
