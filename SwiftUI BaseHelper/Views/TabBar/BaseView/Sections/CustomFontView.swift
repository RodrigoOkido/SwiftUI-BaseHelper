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
                .font(Font.openSans(.openSansBold, size: 24))
            Text("Text open sans extra bold")
                .font(Font.openSans(.openSansExtraBold, size: 24))
            Text("Text open sans light")
                .font(Font.openSans(.openSansLight, size: 24))
            Text("Text open sans medium")
                .font(Font.openSans(.openSansMedium, size: 24))
            Text("Text open sans regular")
                .font(Font.openSans(.openSansRegular, size: 24))
            Text("Text open sans semi bold")
                .font(Font.openSans(.openSansSemibold, size: 24))
        }
    }
}

#Preview {
    CustomFontView()
}
