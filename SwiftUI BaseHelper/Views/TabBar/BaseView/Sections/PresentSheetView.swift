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
    @EnvironmentObject var router: Router<DestinationView>
    @State private var showSheet: Bool = false

    var body: some View {
        CustomButton(type: .tertiary,
                     title: "Show Sheet",
                     cornerRadius: .small) {
            router.present(view: DestinationView.sheetView)
        }
    }
}

struct SheetView: View {
    
    // MARK: - Property Wrappers
    @Environment(\.dismiss) var dismissMe
    @EnvironmentObject var router: Router<DestinationView>

    var body: some View {
        VStack {
            Text("Hello! I am a bottom sheet view!")
            CustomButton(title: "Dismiss me!",
                         cornerRadius: .small) {
                router.navigate(to: DestinationView.movies)
            }
            .padding()
        }
    }
}
