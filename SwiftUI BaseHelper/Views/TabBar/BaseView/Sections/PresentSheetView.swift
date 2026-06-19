//
//  PresentStyleView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 17/02/23.
//

import SwiftUI
import DesignSystem

struct PresentSheetView: View {
    
    // MARK: - Property Wrappers
    @Environment(Router<DestinationView>.self) var router: Router<DestinationView>

    // MARK: - Content
    var body: some View {
        VStack(spacing: StackSpacing.quarck) {
            CustomButton(type: .tertiary,
                         title: "Show small Sheet",
                         cornerRadius: .small) {
                router.present(view: DestinationView.sheetView,
                               detents: [.fraction(0.25)])
            }
            CustomButton(type: .tertiary,
                         title: "Show Medium Sheet",
                         cornerRadius: .small) {
                router.present(view: DestinationView.sheetView,
                               detents: [.medium])
            }
            CustomButton(type: .tertiary,
                         title: "Show Medium / Large Sheet",
                         cornerRadius: .small) {
                router.present(view: DestinationView.sheetView,
                               detents: [.medium, .large])
            }
            CustomButton(type: .tertiary,
                         title: "Show Large Sheet",
                         cornerRadius: .small) {
                router.present(view: DestinationView.sheetView)
            }
            CustomButton(type: .tertiary,
                         title: "Show Fullscreen Sheet",
                         cornerRadius: .small) {
                router.presentFullScreen(view: DestinationView.sheetView)
            }
            CustomButton(type: .tertiary,
                         title: "Show Dynamic Sheet",
                         cornerRadius: .small) {
                router.presentWithDynamicHeight(view: DestinationView.dynamicSheetView)
            }
        }
        .padding(.horizontal, InsetSpacing.xxs)
        .navigationTitle("Bottomsheet Types")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SheetView: View {
    
    // MARK: - Property Wrappers
    @Environment(Router<DestinationView>.self) var router: Router<DestinationView>

    // MARK: - Content
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Hello! I am a bottom sheet view!")
                Text("If you selected Medium / Large option, you can drag the sheet view to make it larger or smaller.")
                CustomButton(title: "Dismiss me!",
                             cornerRadius: .small) {
                    router.dismiss()
                }
                .padding()
            }
            .padding(InsetSpacing.xs)
        }
    }
}

struct DynamicSheetView: View {
    
    // MARK: - Property Wrappers
    @Environment(Router<DestinationView>.self) var router: Router<DestinationView>
    @State var height: CGFloat = 0

    // MARK: - Content
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello! I am a bottom sheet view!")
            Text("If you selected Medium / Large option, you can drag the sheet view to make it larger or smaller.")
            CustomButton(title: "Dismiss me!",
                         cornerRadius: .small) {
                router.dismiss()
            }
            .padding()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(InsetSpacing.xs)
        .dynamicContentBasedSheet($height)
    }
}

#Preview {
    PresentSheetView()
        .environment(Router<DestinationView>())
}
