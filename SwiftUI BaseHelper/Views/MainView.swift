//
//  ContentView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct MainView: View {
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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
