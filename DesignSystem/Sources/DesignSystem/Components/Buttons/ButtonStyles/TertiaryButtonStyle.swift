//
//  TertiaryButtonStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 25/06/26.
//
import SwiftUI

public struct TertiaryButtonStyle: ButtonStyle {

    // MARK: - Private Properties
    private let icon: Image
    private let style: ButtonConfigurationStyle

    // MARK: - Initializer
    public init(icon: Image, _ style: ButtonConfigurationStyle = .regular) {
        self.icon = icon
        self.style = style
    }

    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: CornerRadius.md)
                .fill(style.backgroundColor)
                .frame(width: 90, height: 120)
                .overlay {
                    VStack(alignment: .center, spacing: StackSpacing.quark) {
                        Spacer()
                        icon
                            .resizable()
                            .foregroundStyle(style.iconColor)
                            .frame(width: IconSize.md, height: IconSize.md)
                            .aspectRatio(contentMode: .fit)
                            .accessibilityLabel("Icon")
                            .accessibilityAddTraits(.isImage)
                        Spacer()
                        configuration.label
                            .font(style.font)
                            .foregroundColor(style.textColor)
                            .bold()
                            .padding(.horizontal, ButtonPadding.xsmall.value)
                            .padding(.bottom, ButtonPadding.small.value)
                            .accessibilityLabel("Label")
                            .accessibilityAddTraits(.isStaticText)
                    }
                }
        }
        .padding(StackSpacing.nano)
        .opacity(configuration.isPressed ? OpacityLevel.opaque : OpacityLevel.solid)
    }
}
