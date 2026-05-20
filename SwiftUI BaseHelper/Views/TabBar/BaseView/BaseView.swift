//
//  BaseView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct BaseView: View {
    
    @Environment(Router<DestinationView>.self) var router: Router<DestinationView>
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Section("Components") {
                    CustomButton(title: "Cards",
                                 action: {
                        router.navigate(to: DestinationView.componentsView)
                    })
                    CustomButton(title: "Textfields",
                                 action: {
                        router.navigate(to: DestinationView.textFieldView)
                    })
                    CustomButton(title: "Progress bars",
                                 action: {
                        router.navigate(to: DestinationView.progressBarsView)
                    })
                    CustomButton(title: "Actions & Pickers",
                                 action: {
                        router.navigate(to: DestinationView.actionAndSelectableView)
                    })
                    CustomButton(title: "Charts",
                                 action: {
                        router.navigate(to: DestinationView.chartsView)
                    })
                }
                
                Section("Navigation"){
                    CustomButton(title: "Present View",
                                 action: {
                        router.navigate(to: DestinationView.presentSheetView)
                    })
                }

                Section("Special") {
                    CustomButton(title: "View Modifiers",
                                 action: {
                        router.navigate(to: DestinationView.viewModifiersView)
                    })
                    CustomButton(title: "Haptics Feedback",
                                 action: {
                        router.navigate(to: DestinationView.hapticsFeedbackView)
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
            }
            .padding()
        }
        .navigationTitle("Base")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    BaseView()
}
