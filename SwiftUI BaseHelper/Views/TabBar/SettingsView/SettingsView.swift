//
//  SettingsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/01/23.
//

import SwiftUI
import DesignSystem

struct SettingsView: View {
    
    // MARK: - View Model
    @ObservedObject var viewModel: SettingsViewModel

    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("appLanguage") private var appLanguage: AppLanguage = .English

    // MARK: - Initializer
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode, label: {
                        HStack {
                            Text("Dark Mode")
                                .bold()
                        }
                    })
                    Picker("App Language", 
                           selection: $viewModel.language,
                           content: {
                        ForEach(AppLanguage.allCases, content: { lang in
                            Text(lang.rawValue)
                        })
                    })
                    .bold()
                    .onChange(of: viewModel.language) { oldValue, newValue in
                        if oldValue != newValue {
                            appLanguage = newValue
                        }
                    }
                }
                Section(header: Text("Social")) {
                    Link("Github Profile", destination: URL(string: "https://github.com/RodrigoOkido/")!)
                    Link("Linkedin Profile", destination: URL(string: "https://www.linkedin.com/in/rodrigo-okido/")!)
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel(language: .English))
}
