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
                    router.navigate(to: DestinationView.labelView)
                })
                CustomButton(title: "Textfield",
                             action: {
                    router.navigate(to: DestinationView.textFieldView)
                })
                CustomButton(title: "Actions & Pickers",
                             action: {
                    router.navigate(to: DestinationView.actionAndSelectableView)
                })
                CustomButton(title: "Chats",
                             action: {
                    router.navigate(to: DestinationView.chartsView)
                })
                CustomButton(title: "View Modifiers",
                             action: {
                    router.navigate(to: DestinationView.viewModifiersView)
                })
                CustomButton(title: "Haptics Feedback",
                             action: {
                    router.navigate(to: DestinationView.hapticsFeedbackView)
                })
                CustomButton(title: "Present View",
                             action: {
                    router.navigate(to: DestinationView.presentSheetView)
                })
                CustomButton(title: "Dates View",
                             action: {
                    router.navigate(to: DestinationView.datesView)
                })
                CustomButton(title: "Custom Fonts View",
                             action: {
                    router.navigate(to: DestinationView.customFontsView)
                })
                CustomButton(title: "iOS17 ObservableMacro",
                             action: {
                    router.navigate(to: DestinationView.observableMacro)
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
