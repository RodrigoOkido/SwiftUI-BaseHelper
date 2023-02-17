//
//  PresentStyleView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 17/02/23.
//

import SwiftUI

struct PresentSheetView: View {
    
    // MARK: - Property Wrappers
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .padding()
        .background(.purple)
        .foregroundColor(.white)
        .cornerRadius(10)
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}

struct SheetView: View {
    
    // MARK: - Property Wrappers
    @Environment(\.dismiss) var dismissMe
    
    var body: some View {
        VStack {
            Text("Hello! I am a bottom sheet view!")
            Button("Dismiss me!") {
                dismissMe()
            }
            .padding()
            .background(.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
