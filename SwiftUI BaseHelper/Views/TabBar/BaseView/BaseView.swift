//
//  BaseView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct BaseView: View {
    
    // MARK: - Property Wrappers
    @Environment(Router<DestinationView>.self) var router: Router<DestinationView>
    
    // MARK: - Content
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Section("Components") {
                    CustomButton(title: "Buttons",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.buttonsView)
                    })
                    CustomButton(title: "Cards",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.cardsView)
                    })
                    CustomButton(title: "Charts",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.chartsView)
                    })
                    CustomButton(title: "Dates Handling View",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.datesView)
                    })
                    CustomButton(title: "Pickers & Toggles",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.pickersAndTogglesView)
                    })
                    CustomButton(title: "Progress bars",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.progressBarsView)
                    })
                    CustomButton(title: "Textfields",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.textFieldView)
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
                        router.navigate(to: DestinationView.customTextAndFontsView)
                    })
                    CustomButton(title: "Payment Form",
                                 alignment: .leading,
                                 action: {
                        router.navigate(to: DestinationView.paymentFormView)
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
