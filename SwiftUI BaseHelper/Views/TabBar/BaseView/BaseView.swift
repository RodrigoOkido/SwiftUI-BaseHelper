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
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.cardsView)
                    })
                    CustomButton(title: "Textfields",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.textFieldView)
                    })
                    CustomButton(title: "Progress bars",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.progressBarsView)
                    })
                    CustomButton(title: "Actions & Pickers",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.actionAndSelectableView)
                    })
                    CustomButton(title: "Dates Handling View",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.datesView)
                    })
                    CustomButton(title: "Charts",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.chartsView)
                    })
                }
                
                Section("Navigation"){
                    CustomButton(title: "Present View",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.presentSheetView)
                    })
                }

                Section("Special") {
                    CustomButton(title: "Geometry Reader",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.geometryReaderExampleView)
                    })
                    CustomButton(title: "Haptics Feedback",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.hapticsFeedbackView)
                    })
                    CustomButton(title: "Custom Fonts View",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.customFontsView)
                    })
                    
                    CustomButton(title: "iOS17 Bindable Example",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.bindableView)
                    })
                }
            }
            .padding()
        }
        .navigationTitle("Topics")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    BaseView()
}
