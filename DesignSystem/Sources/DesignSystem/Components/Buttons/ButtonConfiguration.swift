//
//  ButtonConfiguration.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 24/04/25.
//
import SwiftUI

public enum ButtonType {
    
    case primary
    case secondary
    case tertiary
    
    var fontSize: Font {
        switch self {
        case .primary: .title3
        case .secondary: .headline
        case .tertiary: .callout
        }
    }
    var backgroundColor: Color {
        switch self {
        case .primary: .cyan
        case .secondary: .orange
        case .tertiary: .purple
        }
    }
    var textColor: Color {
        switch self {
        case .primary: .black
        case .secondary: .white
        case .tertiary: .white
        }
    }
}

public enum ButtonHeight {
    case small
    case normal
    case large
    case extraLarge
    
    var size: CGFloat {
        switch self {
        case .small:
            return HeightSize.sm
        case .normal:
            return HeightSize.md
        case .large:
            return HeightSize.lg
        case .extraLarge:
            return HeightSize.xl
        }
    }
}

public enum ButtonPadding {
    case small
    case normal
    case large
    case extraLarge
    
    var value: CGFloat {
        switch self {
        case .small:
            return InsetSpacing.xs
        case .normal:
            return InsetSpacing.md
        case .large:
            return InsetSpacing.lg
        case .extraLarge:
            return InsetSpacing.xl
        }
    }
}

public enum ButtonCornerRadius {
    case small
    case normal
    case large
    
    var value: CGFloat {
        switch self {
        case .small:
            return CornerRadius.sm
        case .normal:
            return CornerRadius.md
        case .large:
            return CornerRadius.lg
        }
    }
}
