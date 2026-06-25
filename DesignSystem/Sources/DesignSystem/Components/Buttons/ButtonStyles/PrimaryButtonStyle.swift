//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 25/06/26.
//
import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {

    // MARK: - Private Properties
    private let icon: Image?
    private let style: ButtonConfigurationStyle

    // MARK: - Initializer
    public init(icon: Image? = nil, _ style: ButtonConfigurationStyle = .regular) {
        self.icon = icon
        self.style = style
    }

    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            if let icon {
                icon
                    .resizable()
                    .foregroundStyle(style.iconColor)
                    .frame(width: IconSize.sm, height: IconSize.sm)
                    .aspectRatio(contentMode: .fit)
                    .accessibilityLabel("Icon")
                    .accessibilityAddTraits(.isImage)
            }
            configuration.label
                .font(style.font)
                .foregroundColor(style.textColor)
                .bold()
                .contentShape(Rectangle())
                .opacity(configuration.isPressed ? OpacityLevel.opaque : OpacityLevel.solid)
                .accessibilityLabel("Label")
                .accessibilityAddTraits(.isStaticText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, ButtonPadding.large.value)
        .padding(.vertical, ButtonPadding.normal.value)
        .background(style.backgroundColor)
        .cornerRadius(CornerRadius.nano)
    }
}
