//
//  ComponentsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//
import SwiftUI
import DesignSystem

struct ComponentsView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: StackSpacing.md){
                SimpleCardView(
                    headerImage: Image("header_sample", bundle: .main),
                    title: "Card with Image",
                    description: "Test description with a very long text to test the multiline text. And more text to fill the card",
                    action: {}
                )
                
                SimpleCardView(
                    title: "Card",
                    description: "Test description with a very long text to test the multiline text. And more text to fill the card",
                    action: {}
                )
                
                ExpandableCardView(title: "Expandable Card",
                                   innerDescription: "This is the hidden content that appears when the card is expanded. You can put any information here that you want to show when the user taps on the card.")
            }
            .padding()
        }
    }
}

#Preview {
    ComponentsView()
}
