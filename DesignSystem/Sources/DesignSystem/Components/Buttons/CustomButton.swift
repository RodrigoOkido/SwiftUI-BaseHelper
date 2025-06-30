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
    private let height: ButtonHeight
    private let padding: ButtonPadding
    private let cornerRadius: ButtonCornerRadius
    private let action: () -> Void
    
    public init(type: ButtonType = .primary,
         title: String,
         height: ButtonHeight = .normal,
         padding: ButtonPadding = .normal,
         cornerRadius: ButtonCornerRadius = .normal,
         action: @escaping () -> Void) {
        self.type = type
        self.title = title
        self.height = height
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(title)
                    .font(type.fontSize)
                    .foregroundColor(type.textColor)
                    .bold()
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
