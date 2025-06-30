//
//  SettingsViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 22/03/24.
//

import Foundation
import DesignSystem

class SettingsViewModel: BaseViewModel {

    // MARK: - Property Wrapper
    var language: AppLanguage

    // MARK: - Initializer
    init(language: AppLanguage) {
        self.language = language
    }
}
