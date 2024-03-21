//
//  ContentView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("appLanguage") private var appLanguage: Language = .English

    // MARK: - Stored Properties
    let appDependencies: AppDependencies

    // MARK: - Initializer
    init(appDependencies: AppDependencies = AppDependencies()) {
        self.appDependencies = appDependencies
        self.appDependencies.setup()
    }

    var body: some View {
        TabView {
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
                SettingsView(language: appLanguage)
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .environment(\.locale, .init(identifier: appLanguage.rawValue))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    MainView()
}
