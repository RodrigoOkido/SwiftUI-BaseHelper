//
//  DestinationView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/08/24.
//

import SwiftUI
import DesignSystem

public enum DestinationView: Identifiable, Hashable {

    case home
    case movies
    case map
    case settings(appLanguage: AppLanguage)

    // MARK: - Computed Properties
    public var id: String {
        switch self {
        case .home:
            return "home"
        case .movies:
            return "movies"
        case .map:
            return "map"
        case .settings(_):
            return "settings"
        }
    }

    @ViewBuilder
    public var view: some View {
        switch self {
        case .home:
            BaseView()
        case .movies:
            APIView()
        case .map:
            MapView()
        case .settings(let appLanguage):
            SettingsView(viewModel: SettingsViewModel(language: appLanguage))
        }
    }
}
