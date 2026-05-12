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
    @State var firstName: String
    @State var lastName: String
    @State var middleName: String
    @State var focus: Color

    // MARK: - Initializer
    init(firstName: String = "Apple",
         lastName: String = "Framework",
         middleName: String = "SwiftUI",
         focus: Color = .cyan) {
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.focus = focus
    }

    var body: some View {
        VStack {
            CustomTextField(fieldName: "First Name",
                            placeholder: "Your name",
                            leadingIcon: Image(systemName: "person.crop.circle"),
                            text: $firstName)
            CustomTextField(fieldName: "Middle name",
                            placeholder: "middleName",
                            trailingIcon: Image(systemName: "eye"),
                            text: $middleName)
            
            SimpleTextField(fieldName: "Last name", placeholder: "Last name", text: $lastName)
            
            Text("Output: Hello \(firstName) \(middleName) \(lastName)!")
                .padding()
        }
        .padding()
        .navigationTitle("Textfield")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    TextFieldView(firstName: "Apple", 
                  lastName: "Framework")
}
