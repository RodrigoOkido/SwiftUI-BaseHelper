//
//  Navigation.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/08/24.
//

import SwiftUI

public struct NavigationViewFactory {

    @ViewBuilder
    static func make(_ destinationView: DestinationView,
                     router: Router<DestinationView> = Router<DestinationView>()) -> some View {
        Navigation(
            rootView: destinationView.makeView,
            router: router
        ).environmentObject(router)
    }
}

public struct Navigation<RootView: View>: View {

    // MARK: - Stored Properties
    let rootView: RootView

    // MARK: - Wrapped Properties
    @StateObject var router: Router<DestinationView>

    // MARK: - Content
    public var body: some View {
        NavigationStack(path: $router.path) {
            rootView
                .navigationDestination(for: DestinationView.self) { destination in
                    destination.makeView
                }
        }
        .sheet(item: $router.presentedView,
               onDismiss: { router.dismiss() },
               content: { rootSheetView in
            NavigationStack(path: $router.bottomSheetPath) {
                rootSheetView.makeView
                    .navigationDestination(for: DestinationView.self) { destination in
                        destination.makeView
                    }
            }
        })
    }
}
