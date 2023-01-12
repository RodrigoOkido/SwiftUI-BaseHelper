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
            NavigationView(content: {
                BaseView()
            })
            .tabItem {
                Label("Components", systemImage: "rectangle.3.group.fill")
            }
            NavigationView(content: {
                APIView()
            })
            .tabItem {
                Label("API", systemImage: "network")
            }
            NavigationView(content: {
                MapView()
            })
            .tabItem {
                Label("Map", systemImage: "map")
            }
            NavigationView(content: {
                SettingsView()
            })
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
