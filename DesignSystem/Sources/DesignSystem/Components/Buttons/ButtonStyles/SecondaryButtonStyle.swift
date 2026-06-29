//
//  SecondaryButtonStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 25/06/26.
//
import SwiftUI

public struct SecondaryButtonStyle: ButtonStyle {

    // MARK: - Private Properties
    private let icon: Image
    private let style: ButtonConfigurationStyle
    private let shouldShowLabel: Bool
    
    // MARK: - Initializer
    public init(icon: Image, _ style: ButtonConfigurationStyle = .regular, shouldShowLabel: Bool) {
        self.icon = icon
        self.style = style
        self.shouldShowLabel = shouldShowLabel
    }

    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: StackSpacing.quark) {
            Circle()
                .fill(style.backgroundColor)
                .frame(width: 60, height: 60)
                .overlay {
                    icon
                        .resizable()
                        .foregroundStyle(style.iconColor)
                        .frame(width: IconSize.sm, height: IconSize.sm)
                        .aspectRatio(contentMode: .fit)
                        .accessibilityLabel("Icon")
                        .accessibilityAddTraits(.isImage)
                }
            if shouldShowLabel {
                configuration.label
                    .font(style.font)
                    .foregroundColor(style.textColor)
                    .bold()
                    .accessibilityLabel("Label")
                    .accessibilityAddTraits(.isStaticText)
            }
        }
        .padding(StackSpacing.nano)
        .contentShape(Rectangle())
        .opacity(configuration.isPressed ? OpacityLevel.opaque : OpacityLevel.solid)
        .accessibilityAddTraits(.isButton)
    }
}
