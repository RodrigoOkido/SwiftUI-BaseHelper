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

#Preview {
    SimpleTextField(fieldName: "Simple Textfield",
                    placeholder: "Enter your input",
                    textContent: .constant(""))
    RegularTextField(fieldName: "Regular Textfield",
                     placeholder: "Enter your input",
                     leadingIcon: Image(systemName: "person.crop.circle"),
                     textContent: .constant(""))
    RegularTextField(fieldName: "Regular Textfield",
                     placeholder: "Enter your input",
                     trailingIcon: Image(systemName: "magnifyingglass"),
                     textContent: .constant(""))
    PasswordTextField(fieldName: "Password",
                      placeholder: "Your password",
                      textContent: .constant(""))
    TextAreaField(fieldName: "Text Area", placeholder: "Enter your text", textContent: .constant(""))
}
