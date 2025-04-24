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
            NavigationViewFactory.make(.home)
                .tabItem {
                    Label("Components", systemImage: "rectangle.3.group.fill")
                }
            NavigationViewFactory.make(.movies)
                .tabItem {
                    Label("API", systemImage: "network")
                }
            NavigationViewFactory.make(.map)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            NavigationViewFactory.make(.settings(appLanguage: appLanguage))
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
