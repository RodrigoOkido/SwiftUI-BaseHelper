//
//  LabelView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        VStack {
            Text("I am a 'largeTitle' label!")
                .font(.largeTitle)
            Text("I am a 'title' label!")
                .font(.title)
            Text("I am a 'title2' label!")
                .font(.title2)
            Text("I am a 'title3' label!")
                .font(.title3)
            Text("I am a 'headline' label!")
                .font(.headline)
            Text("I am a 'subheadline' label!")
                .font(.subheadline)
            Text("I am a 'footnote' label!")
                .font(.footnote)
            Text("I am a 'caption' label!")
                .font(.caption)
            Text("I am a 'caption2' label!")
                .font(.caption2)
        }
        .padding()
        .navigationTitle("Label")
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView()
    }
}
