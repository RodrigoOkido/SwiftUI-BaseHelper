//
//  Font+Extensions.swift
//
//
//  Created by Rodrigo Okido on 12/03/24.
//

import SwiftUI

@MainActor
public extension Font {

    static var openSansInitialized = false

    static func openSans(_ openSans: OpenSans, size: CGFloat) -> Font {
        if !openSansInitialized {
            print("Custom Font OpenSans not registered.")
        }
        return .custom(openSans.rawValue, size: size)
    }

    nonisolated static func listAllFonts() {
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
    }
}
