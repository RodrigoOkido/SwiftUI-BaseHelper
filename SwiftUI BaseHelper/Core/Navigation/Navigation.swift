//
//  Navigation.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/08/24.
//

import SwiftUI

public struct Navigation<RootView: View>: View {

    // MARK: - Stored Properties
    let rootView: RootView

    // MARK: - Wrapped Properties
    @EnvironmentObject var router: Router<DestinationView>

    // MARK: - Content
    public var body: some View {
        NavigationStack(path: $router.path) {
            rootView
                .navigationDestination(for: DestinationView.self) { page in
                    NavigationViewFactory.make(page, router: router)
                        .environmentObject(router)
                        .navigationBarBackButtonHidden(true)
                }
        }
        .sheet(item: $router.sheet) { rootView in
            NavigationStack(path: $router.bottomSheetPath) {
                NavigationViewFactory.make(rootView, router: router)
                    .navigationDestination(for: DestinationView.self) { destinationView in
                        NavigationViewFactory.make(destinationView, router: router)
                            .environmentObject(router)
                            .navigationBarBackButtonHidden(true)
                    }
            }
        }
    }
}

public struct NavigationViewFactory {

    @ViewBuilder
    static func make(_ destinationView: DestinationView,
                     router: Router<DestinationView> = Router<DestinationView>()) -> some View {
        Navigation(
            rootView: destinationView.view
        ).environmentObject(router)
    }
}
