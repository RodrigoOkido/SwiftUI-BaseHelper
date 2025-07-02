//
//  CustomButton.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

public struct CustomButton: View {
    
    // MARK: - Stored Properties
    private let type: ButtonType
    private let title: String
    private let leadingImage: Image?
    private let trailingImage: Image?
    private let height: ButtonHeight
    private let padding: ButtonPadding
    private let cornerRadius: ButtonCornerRadius
    private let action: () -> Void
    
    public init(type: ButtonType = .primary,
                title: String,
                leadingImage: Image? = nil,
                trailingImage: Image? = nil,
                height: ButtonHeight = .normal,
                padding: ButtonPadding = .normal,
                cornerRadius: ButtonCornerRadius = .normal,
                action: @escaping () -> Void) {
        self.type = type
        self.title = title
        self.action = action
        self.leadingImage = leadingImage
        self.trailingImage = trailingImage
        self.height = height
        self.padding = padding
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: StackSpacing.nano) {
                if let leadingImage {
                    leadingImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ButtonHeight * 0.6, height: ButtonHeight * 0.6)
                }
                Text(title)
                    .font(type.fontSize)
                    .foregroundColor(type.textColor)
                    .bold()
                if let trailingImage {
                    trailingImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ButtonHeight * 0.6, height: ButtonHeight * 0.6)
                }
            }
            .frame(height: height.size)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, padding.value)
            .background(type.backgroundColor)
            .cornerRadius(cornerRadius.value)
        }
    }

}

#Preview {
    CustomButton(title: "Test",
                 action: {})
}
