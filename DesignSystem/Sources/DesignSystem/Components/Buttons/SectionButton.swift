//
//  SectionButton.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

public struct SectionButton: View {

    // MARK: - Stored Properties
    var sectionTitle: String
    var destinationView: AnyView
    
    public init(sectionTitle: String, destinationView: AnyView) {
        self.sectionTitle = sectionTitle
        self.destinationView = destinationView
    }

    public var body: some View {
        NavigationLink {
            destinationView
        } label: {
            VStack {
                Text(sectionTitle)
                    .font(.title3)
                    .foregroundColor(.black)
                    .bold()
            }
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            .background(.cyan)
            .cornerRadius(10)
        }
    }

}

#Preview {
    SectionButton(sectionTitle: "Test", 
                  destinationView: AnyView(EmptyView()))
}
