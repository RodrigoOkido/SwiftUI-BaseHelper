//
//  NetworkRequestError.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

/// Request error object providing informations about what went wrong in the REST request
public struct NetworkRequestError: Codable, Error {

    public var statusCode: Int?
    public var error: String?
    public var isTokenError: Bool?

    public init(statusCode: Int? = nil,
                error: String? = nil,
                isTokenError: Bool? = nil) {
        self.statusCode = statusCode
        self.error = error
        self.isTokenError = isTokenError
    }
}
