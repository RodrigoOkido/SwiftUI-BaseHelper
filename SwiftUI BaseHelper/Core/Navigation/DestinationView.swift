//
//  DestinationView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/08/24.
//

import Foundation
import SwiftUI

public enum DestinationView: Identifiable, Hashable {

    case home
    case movies
    case settings

    // MARK: - Computed Properties
    public var id: String {
        switch self {
        case .home:
            return "home"
        case .movies:
            return "movies"
        case .settings:
            return "settings"
        }
    }

    public var view: some View {
        return EmptyView()
    }
}
