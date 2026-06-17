//
//  TextFieldView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct TextFieldView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var simpleTextFieldInput: String
    @State var regularTextFieldInput: String
    @State var regularTextFieldInput2: String
    @State var passwordTextFieldInput: String
    @State var modifierTextFieldInput: String
    @State var textAreaInputField: String

    // MARK: - Initializer
    init(simpleTextFieldInput: String = "",
         regularTextFieldInput: String = "",
         regularTextFieldInput2: String = "",
         passwordTextFieldInput: String = "",
         modifierTextFieldInput: String = "",
         textAreaInputField: String = "") {
        self.simpleTextFieldInput = simpleTextFieldInput
        self.regularTextFieldInput = regularTextFieldInput
        self.regularTextFieldInput2 = regularTextFieldInput2
        self.passwordTextFieldInput = passwordTextFieldInput
        self.modifierTextFieldInput = modifierTextFieldInput
        self.textAreaInputField = textAreaInputField
    }

    var body: some View {
        ScrollView {
            VStack {
                SimpleTextField(style: .bordered, fieldName: "Simple TextField", placeholder: "Simple Text Field", textContent: $simpleTextFieldInput)
                RegularTextField(style: .bordered,
                                 fieldName: "Regular TextField",
                                 placeholder: "Enter your text",
                                 leadingIcon: Image(systemName: "person.crop.circle"),
                                 textContent: $regularTextFieldInput)
                RegularTextField(style: .bordered,
                                 fieldName: "Regular TextField 2",
                                 placeholder: "Enter your text",
                                 trailingIcon: Image(systemName: "magnifyingglass"),
                                 textContent: $regularTextFieldInput2)
                
                PasswordTextField(style: .bordered,
                                  fieldName: "Password TextField",
                                  placeholder: "Password",
                                  textContent: $passwordTextFieldInput)
                TextAreaField(fieldName: "Area TextField",
                              placeholder: "Enter your text",
                              textContent: $textAreaInputField)
            }
        }
        .padding()
        .navigationTitle("Textfields")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    TextFieldView()
}
