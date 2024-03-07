//
//  SettingsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/01/23.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section(header: Text("Appearance")) {
                    HStack {
                        Text("Dark Mode")
                            .bold()
                        Spacer()
                        Toggle("", isOn: $isDarkMode)
                    }
                }
                Section(header: Text("Social")) {
                    HStack {
                        Link("Github Profile", destination: URL(string: "https://github.com/RodrigoOkido/")!)
                    }
                    HStack {
                        Link("Linkedin Profile", destination: URL(string: "https://www.linkedin.com/in/rodrigo-okido/")!)
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    SettingsView()
}
