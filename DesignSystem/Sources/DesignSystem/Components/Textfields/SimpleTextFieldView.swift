//
//  SimpleTextFieldView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//

import SwiftUI

/// Simple Textfield that provides only the input field without any styling like icons on
/// leading or trailing. Use RegularTextField for this purpose.
///
/// Usage example:
/// ```swift
///     SimpleTextField(style: .bordered,
///                     fieldName: "Name",
///                     placeholder: "Insert your name",
///                     textContent: .constant(""))
/// ```
public struct SimpleTextFieldView: CustomTextField, View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @FocusState public var isFocused: Bool
    @Binding public var textContent: String

    // MARK: - Public Properties
    public var style: TextfieldStyle
    public var fieldName: String
    public var placeholder: String
    
    // MARK: - Computed Properties
    private var borderColor: Color {
        isFocused ? .orange : isDarkMode ? .white : .black
    }
    
    // MARK: - Initializer
    public init(
         style: TextfieldStyle,
         fieldName: String,
         placeholder: String,
         textContent: Binding<String>) {
        self.style = style
        self.fieldName = fieldName
        self.placeholder = placeholder
        self._textContent = textContent
    }
    
    // MARK: - Content
    public var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .bold()
                .accessibilityLabel(fieldName)
                .accessibilityAddTraits(.isStaticText)
            TextField(placeholder,
                      text: $textContent)
            .focused($isFocused)
            .padding()
            .overlay(styleOverlay)
            .animation(.easeInOut(duration: 0.2), value: isFocused)
            .accessibilityLabel(placeholder)
            .accessibilityValue(textContent)
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
    SimpleTextFieldView(style: .bordered,
                    fieldName: "Name",
                    placeholder: "Insert your name",
                    textContent: .constant(""))
    SimpleTextFieldView(style: .underline,
                    fieldName: "Name",
                    placeholder: "Insert your name",
                    textContent: .constant(""))
    SimpleTextFieldView(style: .none,
                    fieldName: "Name",
                    placeholder: "Insert your name",
                    textContent: .constant(""))
}
