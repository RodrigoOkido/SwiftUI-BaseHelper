//
//  ButtonsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/06/26.
//

import SwiftUI

struct ButtonsView: View {
    
    var body: some View {
        // MARK: - Buttons
        VStack {
            Text("Buttons")
            VStack {
                Button("Button 1 with viewModifier style") {
                    print("Custom button")
                }
                .modifiedButtonStyle()
                
                Button("Button 2 with viewModifier style") {
                    print("Custom button")
                }
                .modifiedButtonStyle(textColor: .white)
                
                Button("Button 3 with viewModifier style") {
                    print("Custom button")
                }
                .modifiedButtonStyle(color: .purple,
                                     textColor: .white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: .init(lineWidth: 1))
            )
        }
        .padding(5)
    }
}
