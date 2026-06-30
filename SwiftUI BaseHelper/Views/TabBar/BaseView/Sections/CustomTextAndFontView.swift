//
//  CustomFontView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 25/04/25.
//
import SwiftUI
import DesignSystem

struct CustomTextAndFontView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // MARK: - Content
    var body: some View {
        VStack {
            // TEXT WITH MODIFIERS 
            VStack(alignment: .leading, spacing: StackSpacing.lg) {
                sectionHeader("Textstyle modifier")
                VStack(alignment: .leading) {
                    Text("Hello i am a title!")
                        .textStyle(.title)
                    Text("Hello i am Subtitle!")
                        .textStyle(.subtitle)
                    Text("Hello i am secondary Subtitle!")
                        .textStyle(.subtitle2)
                    Text("Hello i am regular text!")
                        .textStyle(.regular)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
            }
            .padding(InsetSpacing.md)

            // CUSTOM FONTS
            VStack(alignment: .leading, spacing: StackSpacing.lg) {
                sectionHeader("CUSTOM FONTS")
                VStack(alignment: .leading) {
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
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(InsetSpacing.md)
            Spacer()
        }
        .navigationTitle("Fonts")
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
    }
}

#Preview {
    CustomTextAndFontView()
}
