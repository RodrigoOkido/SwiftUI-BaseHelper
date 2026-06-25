//
//  ButtonStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 17/06/26.
//
import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {

    // MARK: - Private Properties
    private var style: ButtonType

    // MARK: - Initializer
    public init(_ style: ButtonType = .regular) {
        self.style = style
    }

    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, ButtonPadding.large.value)
            .padding(.vertical, ButtonPadding.normal.value)
            .background(style.backgroundColor)
            .font(style.font)
            .foregroundColor(style.textColor)
            .bold()
            .contentShape(Rectangle())
            .opacity(configuration.isPressed ? OpacityLevel.opaque : OpacityLevel.solid)
            .cornerRadius(CornerRadius.nano)
    }
}

public struct SecondaryButtonStyle: ButtonStyle {

    // MARK: - Public Properties
    private let style: ButtonType
    private let icon: Image
    
    // MARK: - Initializer
    public init(_ style: ButtonType = .regular, icon: Image) {
        self.style = style
        self.icon = icon
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
                }
            configuration.label
                .font(style.font)
                .foregroundColor(style.textColor)
                .bold()
        }
        .padding(StackSpacing.nano)
        .contentShape(Rectangle())
        .opacity(configuration.isPressed ? OpacityLevel.opaque : OpacityLevel.solid)
    }
}

public struct TertiaryButtonStyle: ButtonStyle {

    // MARK: - Private Properties
    private let icon: Image
    private let style: ButtonType

    // MARK: - Initializer
    public init(_ style: ButtonType = .regular, icon: Image) {
        self.style = style
        self.icon = icon
    }

    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: CornerRadius.md)
                .fill(style.backgroundColor)
                .frame(width: 110, height: 140)
                .overlay {
                    VStack(alignment: .center, spacing: StackSpacing.quark) {
                        Spacer()
                        icon
                            .resizable()
                            .foregroundStyle(style.iconColor)
                            .frame(width: IconSize.md, height: IconSize.md)
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                        configuration.label
                            .font(style.font)
                            .foregroundColor(style.textColor)
                            .bold()
                            .padding(.horizontal, ButtonPadding.xsmall.value)
                            .padding(.bottom, ButtonPadding.small.value)
                    }
                }
        }
        .padding(StackSpacing.nano)
        .opacity(configuration.isPressed ? OpacityLevel.opaque : OpacityLevel.solid)
    }
}
