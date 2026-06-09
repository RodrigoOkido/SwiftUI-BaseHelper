//
//  PasswordTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 14/05/26.
//
import SwiftUI

public struct PasswordTextField: CustomTextField, View {
    
    // MARK: - Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @FocusState public var isFocused: Bool
    @Binding public var textContent: String
    @State public var shouldShowPassword: Bool

    // MARK: - Public Properties
    public var fieldName: String
    public var placeholder: String
    
    // MARK: - Computed Properties
    private var borderColor: Color {
        isFocused ? .orange : isDarkMode ? .white : .black
    }
    
    // MARK: - Init
    public init(
         fieldName: String,
         placeholder: String,
         textContent: Binding<String>) {
        self.fieldName = fieldName
        self.placeholder = placeholder
        self.shouldShowPassword = false
        self._textContent = textContent
    }
    
    // MARK: - Content
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
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.sm)
                    .stroke(borderColor, lineWidth: 1)
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
    }
}

#Preview {
    PasswordTextField(fieldName: "Password",
                    placeholder: "Your password",
                    textContent: .constant(""))
}
