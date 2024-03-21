//
//  ButtonView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

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
    @State var randomInt: Int
    @State var toggleStatus: Bool
    @State var selectedColor: FavoriteColor
    @State var birthDate: Date

    init(randomInt: Int = 0,
         toggleStatus: Bool = false,
         selectedColor: FavoriteColor = .blue, 
         birthDate: Date = Date()) {
        self.randomInt = randomInt
        self.toggleStatus = toggleStatus
        self.selectedColor = selectedColor
        self.birthDate = birthDate
    }

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
                .cornerRadius(CornerRadius.sm)
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
                Text(toggleStatus ? "Toggle on": "Toggle off")
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

#Preview {
    ActionAndSelectableView(randomInt: 0,
                            toggleStatus: true)
}
