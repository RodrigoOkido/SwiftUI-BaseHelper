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
        VStack {
            HStack {
                Text("Appearance")
                    .bold()
                Spacer()
                Toggle("", isOn: $isDarkMode)
            }
            .padding(.horizontal)
            Divider()
        }
        .padding(.horizontal)
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
