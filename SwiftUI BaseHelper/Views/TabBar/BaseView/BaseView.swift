//
//  BaseView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct BaseView: View {
    
    @EnvironmentObject var router: Router<DestinationView>
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                CustomButton(title: "Labels",
                             action: {
                    router.push(DestinationView.labelView)
                })
                CustomButton(title: "Textfield",
                             action: {
                    router.push(DestinationView.textFieldView)
                })
                CustomButton(title: "Actions & Pickers",
                             action: {
                    router.push(DestinationView.actionAndSelectableView)
                })
                CustomButton(title: "Chats",
                             action: {
                    router.push(DestinationView.chartsView)
                })
                CustomButton(title: "View Modifiers",
                             action: {
                    router.push(DestinationView.viewModifiersView)
                })
                CustomButton(title: "Haptics Feedback",
                             action: {
                    router.push(DestinationView.hapticsFeedbackView)
                })
                CustomButton(title: "Present View",
                             action: {
                    router.push(DestinationView.presentSheetView)
                })
                CustomButton(title: "Dates View",
                             action: {
                    router.push(DestinationView.datesView)
                })
            }
            .padding()
        }
        .navigationTitle("Base Components")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    BaseView()
}
