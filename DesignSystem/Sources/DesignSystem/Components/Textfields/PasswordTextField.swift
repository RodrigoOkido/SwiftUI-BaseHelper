//
//  PasswordTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 14/05/26.
//
import SwiftUI

/// Textfield used to provide secure input informations like passwords.
///
/// Usage example:
/// ```swift
///     PasswordTextField(style: .bordered,
///                     fieldName: "Password",
///                     placeholder: "Your password",
///                     textContent: .constant(""))
/// ```
public struct PasswordTextField: CustomTextField, View {
    
    // MARK: - Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @FocusState public var isFocused: Bool
    @Binding public var textContent: String
    @State public var shouldShowPassword: Bool

    // MARK: - Public Properties
    public var style: TextfieldStyle
    public var fieldName: String
    public var placeholder: String
    
    // MARK: - Computed Properties
    private var borderColor: Color {
        isFocused ? .orange : isDarkMode ? .white : .black
    }
    
    // MARK: - Init
    public init(
         style: TextfieldStyle,
         fieldName: String,
         placeholder: String,
         textContent: Binding<String>) {
        self.style = style
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
            .overlay(styleOverlay)
            .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
    }
    
    @ViewBuilder
    private var styleOverlay: some View {
        switch style {
        case .bordered:
            RoundedRectangle(cornerRadius: CornerRadius.sm)
                .stroke(borderColor, lineWidth: 0.5)
        case .underline:
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundStyle(borderColor)
            }
        case .none:
            EmptyView()
        }
    }
}

#Preview {
    PasswordTextField(style: .bordered,
                    fieldName: "Password",
                    placeholder: "Your password",
                    textContent: .constant(""))
    PasswordTextField(style: .underline,
                      fieldName: "Password",
                      placeholder: "Your password",
                      textContent: .constant(""))
    PasswordTextField(style: .none,
                      fieldName: "Password",
                      placeholder: "Your password",
                      textContent: .constant(""))
}
