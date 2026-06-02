//
//  ViewModifiers.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct GeometryReaderExampleView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var inputText: String = ""
    
    var body: some View {
        VStack {
            

        }
        .navigationTitle("View Modifiers")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    GeometryReaderExampleView()
}
