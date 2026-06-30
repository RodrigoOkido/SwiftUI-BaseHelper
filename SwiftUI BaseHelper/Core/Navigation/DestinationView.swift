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
    case swiftData
    case map
    case settings(appLanguage: AppLanguage)
    case sheetView
    case dynamicSheetView
    
    case bindableView
    case buttonsView
    case cardsView
    case paymentFormView
    case chartsView
    case customTextAndFontsView
    case datesView
    case geometryReaderExampleView
    case hapticsFeedbackView
    case pickersAndTogglesView
    case presentSheetView
    case progressBarsView
    case textFieldView
    
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
        case .textFieldView:
            return "textFieldView"
        case .pickersAndTogglesView:
            return "pickersAndTogglesView"
        case .progressBarsView:
            return "progressBarsView"
        case .chartsView:
            return "chartsView"
        case .paymentFormView:
            return "paymentFormView"
        case .geometryReaderExampleView:
            return "geometryReaderExampleView"
        case .hapticsFeedbackView:
            return "hapticsFeedbackView"
        case .presentSheetView:
            return "presentSheetView"
        case .datesView:
            return "datesView"
        case .customTextAndFontsView:
            return "customFontsView"
        case .bindableView:
            return "bindableView"
        case .swiftData:
            return "swiftData"
        case .cardsView:
            return "cardsView"
        case .dynamicSheetView:
            return "dynamicSheetView"
        case .buttonsView:
            return "buttonsView"
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
            APIMovieDetailView(viewModel: APIMovieDetailViewModel(movie: movie))
        case .map:
            MapView()
        case .settings(let appLanguage):
            SettingsView(viewModel: SettingsViewModel(language: appLanguage))
        case .sheetView:
            SheetView()
        case .textFieldView:
            TextFieldView()
        case .paymentFormView:
            PaymentFormView()
        case .pickersAndTogglesView:
            PickersAndTogglesView()
        case .progressBarsView:
            ProgressBarsView()
        case .chartsView:
            ChartsView()
        case .geometryReaderExampleView:
            GeometryReaderExampleView()
        case .hapticsFeedbackView:
            HapticsFeedbackView()
        case .presentSheetView:
            PresentSheetView()
        case .datesView:
            DatesView()
        case .customTextAndFontsView:
            CustomTextAndFontView()
        case .bindableView:
            BindableMacroView()
        case .swiftData:
            SchedulerView()
        case .cardsView:
            CardsView()
        case .dynamicSheetView:
            DynamicSheetView()
        case .buttonsView:
            ButtonsView()
        }
    }
}
