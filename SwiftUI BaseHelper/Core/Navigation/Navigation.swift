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

    // MARK: - Public Properties
    let rootView: RootView

    // MARK: - Wrapped Properties
    @State var router: Router<DestinationView>
    @State var dynamicSheetHeight: CGFloat = 0

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
            .presentationDragIndicator(.visible)
            .sheetDetents(router)
        })
        .fullScreenCover(item: $router.coveredView,
                         onDismiss: { router.dismiss() },
                         content: { rootCoverView in
            NavigationStack(path: $router.bottomSheetPath) {
                rootCoverView.makeView
                    .navigationDestination(for: DestinationView.self) { destination in
                        destination.makeView
                    }
            }
        })
    }
}

// MARK: - Sheet sizing
private extension View {

    /// Applies the native detents from the router, unless the presentation was
    /// started via `presentWithDynamicHeight`, in which case the presented
    /// content is left to size itself (via `dynamicContentBasedSheet`).
    @ViewBuilder
    func sheetDetents<V: Hashable>(_ router: Router<V>) -> some View {
        if router.isDynamicSheetHeight {
            self
        } else {
            self.presentationDetents(router.presentationDetents)
        }
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
