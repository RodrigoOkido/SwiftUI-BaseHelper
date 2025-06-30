//
//  ExpandableCardView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 26/05/25.
//
import SwiftUI

public struct ExpandableCardView: View {
    
    // MARK: - Wrappers
    @State private var isExpanded = false
    
    // MARK: - Private
    private let title: String
    private let innerDescription: String
    
    // MARK: - Init
    public init(title: String, innerDescription: String) {
        self.title = title
        self.innerDescription = innerDescription
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            
            if isExpanded {
                Text(innerDescription)
                    .padding()
                    .transition(.opacity)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ExpandableCardView(
        title: "Expandable Card",
        innerDescription: "This is the hidden content that appears when the card is expanded. You can put any information here that you want to show when the user taps on the card."
    )
    .padding()
}
