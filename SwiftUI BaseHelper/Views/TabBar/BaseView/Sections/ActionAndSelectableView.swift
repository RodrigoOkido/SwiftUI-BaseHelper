//
//  ButtonView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

enum FavoriteColor: String, CaseIterable, Identifiable {
    case blue
    case red
    case green
    case yellow
    case orange
    case purple
    
    var id: FavoriteColor { self }
}

struct ActionAndSelectableView: View {
    
    // MARK: - Property Wrappers
    @State var randomInt: Int = 0
    @State var toggleStatus: Bool = false
    @State var selectedColor: FavoriteColor = .blue
    @State var birthDate = Date()
    
    var body: some View {
        VStack {
            // MARK: - Button
            HStack {
                Button("Generate Number") {
                    randomInt = Int.random(in: 1..<1000)
                }
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                Spacer()
                Text(randomInt.description)
            }
            
            // MARK: - Toggle
            VStack {
                Toggle(isOn: $toggleStatus) {
                    Text("Toggle")
                        .bold()
                        .font(.body)
                }
                Text(toggleStatus ? "Toggle on": "")
                    .animation(.linear)
            }
            
            // MARK: - Picker
            HStack {
                Text("Favorite Color:")
                    .bold()
                Spacer()
                Picker("Favorite Color", selection: $selectedColor, content: {
                    ForEach(FavoriteColor.allCases, content: { color in
                        Text(color.rawValue.capitalized)
                    })
                })
            }
            
           // MARK: - DatePicker
           DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
               Text("Select a date:")
                   .bold()
           }
        }
        .padding()
        .navigationTitle("Actions & Pickers")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionAndSelectableView(randomInt: 0, toggleStatus: true)
    }
}
