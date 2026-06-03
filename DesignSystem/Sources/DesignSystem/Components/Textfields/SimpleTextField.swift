//
//  SimpleTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//

import SwiftUI

public struct SimpleTextField: CustomTextField, View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false

    public var fieldName: String
    public var placeholder: String
    @FocusState public var isFocused: Bool
    @Binding public var textContent: String
    
    private var borderColor: Color {
        isFocused ? .orange : isDarkMode ? .white : .black
    }
    
    public init(fieldName: String,
         placeholder: String,
         textContent: Binding<String>) {
        self.fieldName = fieldName
        self.placeholder = placeholder
        self._textContent = textContent
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .bold()
            TextField(placeholder,
                      text: $textContent)
            .focused($isFocused)
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
    SimpleTextField(fieldName: "Name",
                    placeholder: "Insert your name",
                    textContent: .constant(""))
}
