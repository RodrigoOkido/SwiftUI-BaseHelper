//
//  CustomTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//


import SwiftUI

public protocol CustomTextField {
    
    var fieldName: String { get set }
    var placeholder: String { get set }
    var isFocused: Bool { get set }
    var textContent: String { get set }
}

public struct RegularTextField: CustomTextField, View {
    
    public var fieldName: String
    public var placeholder: String
    public var leadingIcon: Image?
    public var trailingIcon: Image?
    @Binding public var textContent: String
    @FocusState public var isFocused: Bool
    
    private var borderColor: Color {
        isFocused ? .orange : .black
    }
    
    public init(
         fieldName: String,
         placeholder: String,
         leadingIcon: Image? = nil,
         trailingIcon: Image? = nil,
         textContent: Binding<String>) {
        self.fieldName = fieldName
        self.placeholder = placeholder
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self._textContent = textContent
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .bold()
            HStack(spacing: StackSpacing.quarck) {
                if let leadingIcon {
                    leadingIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: IconSize.xs, height: IconSize.xs)
                }
                TextField(placeholder,
                          text: $textContent,
                          axis: .vertical
                )
                .focused($isFocused)
                .padding(.horizontal, InsetSpacing.quarck)
                if let trailingIcon {
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
                    .stroke(borderColor, lineWidth: 1)
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
    }
}

public struct PasswordTextField: CustomTextField, View {
    
    public var fieldName: String
    public var placeholder: String
    @FocusState public var isFocused: Bool
    @Binding public var textContent: String
    @State public var shouldShowPassword: Bool
    
    private var borderColor: Color {
        isFocused ? .orange : .black
    }
    
    public init(
         fieldName: String,
         placeholder: String,
         textContent: Binding<String>) {
        self.fieldName = fieldName
        self.placeholder = placeholder
        self.shouldShowPassword = false
        self._textContent = textContent
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .bold()
            HStack(spacing: StackSpacing.quarck) {
                
                if shouldShowPassword {
                    TextField(placeholder,
                              text: $textContent,
                              axis: .vertical
                    )
                    .focused($isFocused)
                    .padding(.horizontal, InsetSpacing.quarck)
                    
                    Spacer()
                    Image(systemName: "eye")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: IconSize.xs, height: IconSize.xs)
                        .onTapGesture {
                            shouldShowPassword = false
                        }
                } else {
                    SecureField(placeholder, text: $textContent)
                        .focused($isFocused)
                        .padding(.horizontal, InsetSpacing.quarck)
                    Spacer()
                    Image(systemName: "eye.slash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: IconSize.xs, height: IconSize.xs)
                        .onTapGesture {
                            shouldShowPassword = true
                        }
                }

            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: CornerRadius.sm)
                .stroke(borderColor, lineWidth: 1)
        )
        .animation(.easeInOut(duration: 0.2), value: isFocused)
    }
}

#Preview {
    RegularTextField(fieldName: "Name",
                    placeholder: "Your name",
                    leadingIcon: Image(systemName: "person.crop.circle"),
                    textContent: .constant(""))
    PasswordTextField(fieldName: "Password",
                    placeholder: "Your password",
                    textContent: .constant(""))
}
