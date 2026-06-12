//
//  FontRegistrable.swift
//
//
//  Created by Rodrigo Okido on 12/03/24.
//

import Foundation

public enum FontRegisterError: Error {

    case couldNotFindFontFile(String)
    case couldNotRegisterFont(String)
}

@MainActor
public protocol FontRegistrable {

    static func registerFont() throws
}
