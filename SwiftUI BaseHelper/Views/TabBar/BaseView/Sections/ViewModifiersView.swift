//
//  ViewModifiers.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct ViewModifiersView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var inputText: String = ""
    
    var body: some View {
        VStack {
            
            // TEXT
            VStack {
                Text("Hello i am a normal text!")
                    .font(.system(size: 21))
                    .foregroundColor(.blue)
                    .bold()
                Text("Hello i am a modified text!")
                    .modifiedTextStyle()
                Text("Hello i am another modified text!")
                    .modifiedTextStyle(font: .body)
                Text("Hello i am one more modified text!")
                    .modifiedTextStyle(font: .title2, color: isDarkMode ? .white : .black)
            }
            .padding()
            
            // BUTTONS
            VStack {
                Button("Normal Button") {
                    print("Normal Button")
                }
                .padding()
                .background(.orange)
                .font(.body)
                .foregroundColor(.black)
                .bold()
                .cornerRadius(10)
                
                Button("Custom button") {
                    print("Custom button")
                }
                .modifiedButtonStyle()
                
                Button("Custom button 2") {
                    print("Custom button")
                }
                .modifiedButtonStyle(textColor: .white)
                
                Button("Custom button 3") {
                    print("Custom button")
                }
                .modifiedButtonStyle(color: .purple, textColor: .white)
            }
            
            VStack(alignment: .leading) {
                Text("Modified Textfield")
                    .bold()
                TextField("Type something", text: $inputText)
                    .modifiedTextfieldStyle()
            }
            .padding()
        }
        .navigationTitle("View Modifiers")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ViewModifiersView()
}
