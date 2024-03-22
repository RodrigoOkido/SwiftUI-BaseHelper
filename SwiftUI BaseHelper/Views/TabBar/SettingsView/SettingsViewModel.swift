//
//  SettingsViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 22/03/24.
//

import Foundation
import DesignSystem

class SettingsViewModel: ObservableObject {

    // MARK: - Property Wrapper
    @Published var language: AppLanguage

    // MARK: - Initializer
    init(language: AppLanguage) {
        self.language = language
    }
}
