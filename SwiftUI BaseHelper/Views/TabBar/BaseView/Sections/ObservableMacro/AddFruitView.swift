//
//  AddFruitView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/05/25.
//
import SwiftUI

struct AddFruitView: View {
    @Bindable var store: StoreModel
    @State var fruitName: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack() {
            TextField("Fruit name", text: $fruitName)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if !fruitName.isEmpty {
                        store.addFruit(Fruit(name: fruitName))
                    }
                    dismiss()
                }
            
            Button("Add") {
                if !fruitName.isEmpty {
                    store.addFruit(Fruit(name: fruitName))
                }
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
