//
//  TextConfiguration.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 21/06/26.
//
import SwiftUI

public enum TextStyle {
    
    case title
    case regular
    
    var font: Font {
        switch self {
        case .title: .title2
        case .regular: .body
        }
    }

    var textColor: Color {
        return .adaptive(light: .black, dark: .white)
    }
}
