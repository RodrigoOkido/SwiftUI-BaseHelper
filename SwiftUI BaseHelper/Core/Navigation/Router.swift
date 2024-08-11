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

public class Router<View: Hashable>: ObservableObject {

    // MARK: - Wrapped Properties
    @Published public var path = NavigationPath()
    @Published public var bottomSheetPath = NavigationPath()
    @Published public var sheet: View?

    public init() {}

    // MARK: - Public Methods
    public func reset(pathType: PathType = .normal) {
        switch pathType {
        case .normal:
            path = NavigationPath()
        case .sheet:
            bottomSheetPath = NavigationPath()
        }
    }

    public func push(_ view: any Hashable, pathType: PathType = .normal) {
        switch pathType {
        case .normal:
            path.append(view)
        case .sheet:
            bottomSheetPath.append(view)
        }
    }

    public func present(view: View) {
        sheet = view
    }

    public func pop(pathType: PathType = .normal) {
        switch pathType {
        case .normal:
            path.removeLast()
        case .sheet:
            bottomSheetPath.removeLast()
        }
    }

    public func popToRoot(pathType: PathType = .normal) {
        switch pathType {
        case .normal:
            path.removeLast(path.count)
        case .sheet:
            bottomSheetPath.removeLast(bottomSheetPath.count)
        }
    }
}
