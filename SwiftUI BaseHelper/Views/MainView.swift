//
//  ContentView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
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
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
