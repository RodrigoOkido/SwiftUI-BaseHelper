//
//  ObservableMacroView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/05/25.
//
import SwiftUI

struct ObservableMacroView: View {
    
    @Environment(StoreModel.self) private var store
    @State var present: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("** This View is developed using Observable Macro! New feature syntax that came in iOS 17.")
                .font(.caption2)
            
            Text("My Store")
                .font(.callout)
            
            ForEach(store.fruit, id: \.name) { item in
                VStack {
                    Text(item.name)
                        .font(.caption)
                    Divider()
                }
                .padding()
            }
            Button("Add new Fruit") {
                present = true
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $present) {
            AddFruitView(store: store)
        }
    }
}

#Preview {
    ObservableMacroView()
        .environment(StoreModel())
}
