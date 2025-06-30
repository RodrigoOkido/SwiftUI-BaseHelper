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

    public init() {}

    // MARK: - Public Methods
    public func reset() {
        guard presentedView != nil else {
            path = NavigationPath()
            return
        }
        bottomSheetPath = NavigationPath()
    }

    public func navigate(to view: any Hashable) {
        presentedView != nil ? bottomSheetPath.append(view) : path.append(view)
    }

    public func present(view: View) {
        presentedView = view
    }
    
    public func dismiss() {
        presentedView = nil
    }

    public func pop(pathType: PathType = .normal) {
        presentedView != nil ? bottomSheetPath.removeLast() : path.removeLast()
    }

    public func popToRoot(pathType: PathType = .normal) {
        presentedView != nil ? bottomSheetPath.removeLast(bottomSheetPath.count) : path.removeLast(path.count)
    }
}
