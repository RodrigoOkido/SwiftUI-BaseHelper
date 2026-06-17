//
//  Router.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/08/24.
//

import SwiftUI

public enum PathType {
    case normal
    case sheet
}

@Observable
public class Router<View: Hashable> {

    // MARK: - Wrapped Properties
    public var path = NavigationPath()
    public var bottomSheetPath = NavigationPath()
    public var presentedView: View?
    public var presentationDetents: Set<PresentationDetent> = [.large]
    public var coveredView: View?

    // MARK: - Computed Properties
    private var isPresentingOverlay: Bool {
        presentedView != nil || coveredView != nil
    }

    public init() {}

    // MARK: - Public Methods
    public func reset() {
        guard isPresentingOverlay else {
            path = NavigationPath()
            return
        }
        bottomSheetPath = NavigationPath()
    }

    public func navigate(to view: any Hashable) {
        isPresentingOverlay ? bottomSheetPath.append(view) : path.append(view)
    }

    public func present(view: View, detents: Set<PresentationDetent> = [.large]) {
        presentationDetents = detents
        presentedView = view
    }

    public func presentFullScreen(view: View) {
        coveredView = view
    }

    public func dismiss() {
        if coveredView != nil {
            coveredView = nil
        } else {
            presentedView = nil
        }
    }

    public func pop() {
        isPresentingOverlay ? bottomSheetPath.removeLast() : path.removeLast()
    }

    public func popToRoot() {
        isPresentingOverlay ? bottomSheetPath.removeLast(bottomSheetPath.count) : path.removeLast(path.count)
    }
}
