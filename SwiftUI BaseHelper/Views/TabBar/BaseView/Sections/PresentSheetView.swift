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
        VStack(alignment: .leading, spacing: StackSpacing.lg) {
            sectionHeader("Bottomsheet Options")
            VStack(spacing: StackSpacing.nano) {
                CustomButton(type: .regular,
                             title: "Show small Sheet",
                             cornerRadius: .small) {
                    router.present(view: DestinationView.sheetView,
                                   detents: [.fraction(0.25)])
                }
                CustomButton(type: .regular,
                             title: "Show Medium Sheet",
                             cornerRadius: .small) {
                    router.present(view: DestinationView.sheetView,
                                   detents: [.medium])
                }
                CustomButton(type: .regular,
                             title: "Show Medium / Large Sheet",
                             cornerRadius: .small) {
                    router.present(view: DestinationView.sheetView,
                                   detents: [.medium, .large])
                }
                CustomButton(type: .regular,
                             title: "Show Large Sheet",
                             cornerRadius: .small) {
                    router.present(view: DestinationView.sheetView)
                }
                CustomButton(type: .regular,
                             title: "Show Fullscreen Sheet",
                             cornerRadius: .small) {
                    router.presentFullScreen(view: DestinationView.sheetView)
                }
                CustomButton(type: .regular,
                             title: "Show Dynamic Sheet",
                             cornerRadius: .small) {
                    router.presentWithDynamicHeight(view: DestinationView.dynamicSheetView)
                }
            }
        }
        .padding(.horizontal, InsetSpacing.md)
        .navigationTitle("Bottomsheet Types")
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
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
            .padding(InsetSpacing.sm)
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
            Text("Hello! I am a dynamic bottom sheet view!")
            Text("You will notice that the sheet is based on the content size! Generated text for height below: \n")
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do. Eiusmod tempor incididunt ut labore et dolore magna aliqua enim. Ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Aliquip ex ea commodo consequat duis aute irure dolor in. Reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla. Pariatur excepteur sint occaecat cupidatat non proident sunt in culpa. Qui officia deserunt mollit anim id est laborum sed perspiciatis. Unde omnis iste natus error sit voluptatem accusantium doloremque totam. Rem aperiam eaque ipsa quae ab illo inventore veritatis et. Quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam.")
            CustomButton(title: "Dismiss me!",
                         cornerRadius: .small) {
                router.dismiss()
            }
            .padding()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(InsetSpacing.lg)
        .dynamicContentBasedSheet($height)
    }
}

#Preview {
    PresentSheetView()
        .environment(Router<DestinationView>())
}
