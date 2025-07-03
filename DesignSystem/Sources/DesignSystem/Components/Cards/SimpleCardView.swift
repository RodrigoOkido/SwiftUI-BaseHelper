//
//  SimpleCardView.swift
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
    
    public var body: some View {
        VStack(alignment: .leading) {
            if let headerImage {
                headerImage
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                Divider()
                    .padding(.vertical, StackSpacing.nano)
            }
            VStack(alignment: .leading, spacing: StackSpacing.nano) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
                Text(description)
                    .foregroundStyle(.black)
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.3), radius: 2, y: 2)
    }
}
