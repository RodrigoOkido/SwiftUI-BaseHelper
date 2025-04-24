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
    case movieDetails(movie: Movie)
    case map
    case settings(appLanguage: AppLanguage)
    case sheetView
    
    case labelView
    case textFieldView
    case actionAndSelectableView
    case chartsView
    case viewModifiersView
    case hapticsFeedbackView
    case presentSheetView
    case datesView
    
    // MARK: - Computed Properties
    public var id: String {
        switch self {
        case .home:
            return "home"
        case .movies:
            return "movies"
        case .movieDetails:
            return "movieDetails"
        case .map:
            return "map"
        case .settings(_):
            return "settings"
        case .sheetView:
            return "sheetView"
        case .labelView:
            return "labelView"
        case .textFieldView:
            return "textFieldView"
        case .actionAndSelectableView:
            return "actionAndSelectableView"
        case .chartsView:
            return "chartsView"
        case .viewModifiersView:
            return "viewModifiersView"
        case .hapticsFeedbackView:
            return "hapticsFeedbackView"
        case .presentSheetView:
            return "presentSheetView"
        case .datesView:
            return "datesView"
        }
    }

    @ViewBuilder
    public var makeView: some View {
        switch self {
        case .home:
            BaseView()
        case .movies:
            APIView()
        case .movieDetails(let movie):
            APIMovieDetailView(viewModel: APIDetailMovieViewModel(movie: movie))
        case .map:
            MapView()
        case .settings(let appLanguage):
            SettingsView(viewModel: SettingsViewModel(language: appLanguage))
        case .sheetView:
            SheetView()
        case .labelView:
            LabelView()
        case .textFieldView:
            TextFieldView()
        case .actionAndSelectableView:
            ActionAndSelectableView()
        case .chartsView:
            ChartsView()
        case .viewModifiersView:
            ViewModifiersView()
        case .hapticsFeedbackView:
            HapticsFeedbackView()
        case .presentSheetView:
            PresentSheetView()
        case .datesView:
            DatesView()
        }
    }
}
