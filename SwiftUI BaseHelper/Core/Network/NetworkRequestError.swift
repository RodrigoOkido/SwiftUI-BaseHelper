//
//  NetworkRequestError.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public struct NetworkRequestError: Codable, Error {

    public var statusCode: Int?
    public var error: String?
    public var isTokenError: Bool? = false

    public init(
        statusCode: Int? = nil,
        error: String? = nil,
        isTokenError: Bool? = nil
    ) {
        self.statusCode = statusCode
        self.error = error
        self.isTokenError = isTokenError
    }
}
