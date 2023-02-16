//
//  SettingsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/01/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        List {
            HStack {
                Text("Dark Mode")
                    .bold()
                Spacer()
                Toggle("", isOn: $isDarkMode)
            }
            HStack {
                Link("Github Profile", destination: URL(string: "https://www.hackingwithswift.com/quick-start/swiftui")!)
            }
            HStack {
                Link("Linkedin Profile", destination: URL(string: "https://www.linkedin.com/in/rodrigo-okido/")!)
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
