//
//  ButtonConfiguration.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 24/04/25.
//
import SwiftUI

public enum ButtonConfigurationStyle {
    
    case regular
    case success
    case warning
    case danger
    
    var font: Font {
        return .body
    }
    var backgroundColor: Color {
        switch self {
        case .regular: .orange
        case .success: .green
        case .warning: .yellow
        case .danger: .red
        }
    }
    var iconColor: Color {
        switch self {
        case .regular: .white
        default: .clear
        }
    }
    var textColor: Color {
        return .adaptive(light: .black, dark: .white)
    }
}

public enum ButtonHeight {
    case small
    case regular
    case big
    
    var size: CGFloat {
        switch self {
        case .small:
            return HeightSize.xxs
        case .regular:
            return HeightSize.xs
        case .big:
            return HeightSize.sm
        }
    }
}

public enum ButtonPadding {
    case xsmall
    case small
    case normal
    case large
    case extraLarge
    
    var value: CGFloat {
        switch self {
        case .xsmall:
            return InsetSpacing.xs
        case .small:
            return InsetSpacing.sm
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
