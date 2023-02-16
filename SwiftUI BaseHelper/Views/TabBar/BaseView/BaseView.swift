//
//  BaseView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct BaseView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                SectionButton(sectionTitle: "Labels", destinationView: AnyView(LabelView()))
                SectionButton(sectionTitle: "Textfield", destinationView: AnyView(TextFieldView()))
                SectionButton(sectionTitle: "Actions & Pickers", destinationView: AnyView(ActionAndSelectableView()))
                SectionButton(sectionTitle: "Charts", destinationView: AnyView(ChartsView()))
                SectionButton(sectionTitle: "View Modifiers", destinationView: AnyView(ViewModifiersView()))
                SectionButton(sectionTitle: "Haptics Feedback", destinationView: AnyView(HapticsFeedbackView()))
            }
            .padding()
        }
        .navigationTitle("Base Components")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
