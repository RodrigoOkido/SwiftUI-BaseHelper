//
//  Navigation.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/08/24.
//

import SwiftUI

public struct NavigationViewFactory {

    @ViewBuilder
    static func make(_ rootView: DestinationView,
                     router: Router<DestinationView>) -> some View {
        Navigation(
            rootView: rootView.makeView,
            router: router
        )
        .environment(router)
    }
}

public struct Navigation<RootView: View>: View {

    // MARK: - Stored Properties
    let rootView: RootView

    // MARK: - Wrapped Properties
    @State var router: Router<DestinationView>

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

extension Navigation: Hashable, Equatable {
    public static func == (lhs: Navigation, rhs: Navigation) -> Bool {
        switch (lhs, rhs) {
        default:
            return String(describing: lhs) == String(describing: rhs)
        }
    }

    public func hash(into hasher: inout Hasher) { }
}
