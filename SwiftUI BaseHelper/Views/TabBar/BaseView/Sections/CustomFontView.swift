//
//  CustomFontView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 25/04/25.
//
import SwiftUI
import DesignSystem

struct CustomFontView: View {
    
    var body: some View {
        VStack {
            Text("Text open sans bold")
                .font(Font.openSans(.openSansLight, size: 24))
            Text("Text open sans bold")
                .font(.title2)
        }
    }
}

#Preview {
    CustomFontView()
}
