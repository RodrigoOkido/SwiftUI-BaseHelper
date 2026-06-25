//
//  TextConfiguration.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 21/06/26.
//
import SwiftUI

public enum TextStyle {
    
    case title
    case subtitle
    case subtitle2
    case regular
    
    var font: Font {
        switch self {
        case .title: .title
        case .subtitle: .title2
        case .subtitle2: .title3
        case .regular: .body
        }
    }

    var textColor: Color {
        return .adaptive(light: .black, dark: .white)
    }
    
    var fontWeight: Font.Weight {
        switch self {
        case .title: .bold
        case .subtitle: .semibold
        case .subtitle2: .semibold
        case .regular: .regular
        }
    }
}
