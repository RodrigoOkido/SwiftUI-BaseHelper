//
//  OpenSans.swift
//
//
//  Created by Rodrigo Okido on 12/03/24.
//

import SwiftUI

public enum OpenSans: String, CaseIterable, FontRegistrable {

    case openSansBold = "OpenSans-Bold"
    case openSansExtraBold = "OpenSans-ExtraBold"
    case openSansLight = "OpenSans-Light"
    case openSansMedium = "OpenSans-Medium"
    case openSansRegular = "OpenSans-Regular"
    case openSansSemibold = "OpenSans-SemiBold"

    public static func registerFont() throws {
        try Self.allCases.forEach { variant in
            guard let fontURL = Bundle.module.url(forResource: variant.rawValue, withExtension: "ttf"),
                  let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
                  let font = CGFont(fontDataProvider) else {
                assertionFailure("Could not register font")
                throw FontRegisterError.couldNotFindFontFile(variant.rawValue)
            }
            var error: Unmanaged<CFError>?
            guard CTFontManagerRegisterGraphicsFont(font, &error) else {
                guard let fontName = font.postScriptName,
                        UIFont.fontNames(forFamilyName: "Open Sans").contains(fontName as String) else {
                    throw FontRegisterError.couldNotRegisterFont(variant.rawValue)
                }
                return
            }
        }
    }
}
