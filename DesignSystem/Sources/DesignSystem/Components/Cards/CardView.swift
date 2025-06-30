//
//  CardView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 15/05/25.
//
import SwiftUI

public struct SimpleCardView: View {
    
    // MARK: - Private Properties
    private let headerImage: Image?
    private let title: String
    private let description: String
    private let action: (() -> Void)?
    
    // MARK: - Init
    public init(headerImage: Image? = nil,
                title: String,
                description: String,
                action: (() -> Void)?
    ) {
        self.headerImage = headerImage
        self.title = title
        self.description = description
        self.action = action
    }
    
    public init() {
        headerImage = nil
        title = "Test"
        description = "Test description with a very long    text to test the multiline text. And more text to fill the card"
        action = {}
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            if let headerImage {
                headerImage
            }
            Text(title)
                .font(.title2)
                .bold()
            Text(description)
        }
        .padding()
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.3), radius: 2, y: 2)
    }
}

#Preview {
    SimpleCardView()
}
