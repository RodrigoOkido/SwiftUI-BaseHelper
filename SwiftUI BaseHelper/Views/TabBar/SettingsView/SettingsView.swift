//
//  SettingsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/01/23.
//

import SwiftUI

enum Language: String, CaseIterable, Identifiable {
    case English = "en"
    case Portuguese = "pt-BR"

    var id: Language { self }
}

struct SettingsView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("appLanguage") private var appLanguage: Language = .English

    @State var language: Language

    init(language: Language = .English) {
        self.language = language
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
                           selection: $language,
                           content: {
                        ForEach(Language.allCases, content: { lang in
                            Text(lang.rawValue)
                        })
                    })
                    .bold()
                    .onChange(of: language) { oldValue, newValue in
                        if oldValue != newValue {
                            appLanguage = newValue
                        }
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
