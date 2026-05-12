//
//  CustomTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//


import SwiftUI

public enum TextFieldType {
    case regular, phone, email, password, textArea
}

public struct CustomTextField: View {
    
    private let type: TextFieldType
    private let fieldName: String
    private let placeholder: String
    private let leadingIcon: Image?
    private let trailingIcon: Image?
    @State var focus: Color = .black
    @Binding private var text: String
    
    private var keyboardType: UIKeyboardType {
        switch type {
        case .phone: return .phonePad
        case .email: return .emailAddress
        case .password: return .asciiCapable
        default: return .default
        }
    }
    
    public init(type: TextFieldType = .regular,
         fieldName: String,
         placeholder: String,
         leadingIcon: Image? = nil,
         trailingIcon: Image? = nil,
         text: Binding<String>) {
        self.type = type
        self.fieldName = fieldName
        self.placeholder = placeholder
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self._text = text
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .bold()
            HStack(spacing: StackSpacing.quarck) {
                if let leadingIcon, type != .textArea  {
                    leadingIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: IconSize.xs, height: IconSize.xs)
                }
                TextField(placeholder,
                          text: $text,
                          axis: .vertical
                )
                .keyboardType(keyboardType)
                .lineLimit(type == .textArea ? 5 : 1, reservesSpace: type == .textArea)
                .padding(.horizontal, InsetSpacing.quarck)
                if let trailingIcon, type != .textArea {
                    Spacer()
                    trailingIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: IconSize.xs, height: IconSize.xs)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.sm)
                    .stroke(focus, lineWidth: 1)
            )
        }
    }
}

#Preview {
    CustomTextField(fieldName: "Name",
                    placeholder: "Your name",
                    leadingIcon: Image(systemName: "person.crop.circle"),
                    text: .constant(""))
    CustomTextField(fieldName: "Password",
                    placeholder: "Your password",
                    trailingIcon: Image(systemName: "eye"),
                    text: .constant(""))
}
