//
//  SectionButton.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct SectionButton: View {
    
    var sectionTitle: String
    var destinationView: AnyView
    
    var body: some View {
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

struct SectionButton_Previews: PreviewProvider {
    static var previews: some View {
        SectionButton(sectionTitle: "Test", destinationView: AnyView(EmptyView()))
    }
}
