//
//  ButtonConfiguration.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 24/04/25.
//
import SwiftUI

public enum ButtonType {
    
    // Regular Actions
    case primary
    case secondary
    case tertiary
    
    // Call to action
    case success
    case warning
    case danger
    
    var font: Font {
        switch self {
        case .primary, .success, .warning, .danger: .title3
        case .secondary: .headline
        case .tertiary: .callout
        }
    }
    var backgroundColor: Color {
        switch self {
        case .primary: .orange
        case .secondary: .cyan
        case .tertiary: .purple
        case .success: .green
        case .warning: .yellow
        case .danger: .red
        }
    }
    var textColor: Color {
        switch self {
        case .primary, .success, .warning, .danger: .white
        case .secondary: .black
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

public enum ButtonContentPosition {
    case leading
    case center
    case trailing
}
