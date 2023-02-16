//
//  TextFieldView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct TextFieldView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var firstName: String = "Apple"
    @State var lastName: String = "Framework"
    @State var middleName: String = "SwiftUI"
    @State var focus: Color = .cyan
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("First Name:")
                    .bold()
                TextField("First Name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            HStack {
                Text("Last Name:")
                    .bold()
                TextField("Last Name", text: $lastName)
                    .padding(5)
                    .border(isDarkMode ? .blue : .gray)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Middle Name:")
                    .bold()
                TextField("Middle Name", text: $middleName, onEditingChanged: { onFocus in
                        if onFocus {
                            print("On focus")
                            focus = .blue
                        } else {
                            print("Focus off")
                            focus = .cyan
                        }
                    }, onCommit: {
                        print("Commit status")
                    }
                )
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(focus, lineWidth: 2)
                )
            }
            .padding()
            
            Text("Output: Hello \(firstName) \(middleName) \(lastName)!")
                .padding()
        }
        .padding()
        .navigationTitle("Textfield")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(firstName: "Apple", lastName: "Framework")
    }
}
