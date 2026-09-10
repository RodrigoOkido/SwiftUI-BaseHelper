//
//  RequestError.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public enum RequestErrorType: Error, Equatable, Sendable {

    case tokenError
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case timeout
    case conflict
    case serverError
    case couldNotMap
    case undefined
}

public struct RequestError: Error, Equatable, Sendable {

    /// Two errors are considered equal when they describe the same failure kind.
    /// `errorMessage` is server-supplied free text, so comparing it would make
    /// equality depend on backend copy rather than on the error itself.
    public static func == (lhs: RequestError, rhs: RequestError) -> Bool {
        lhs.errorType == rhs.errorType
    }

    public let errorType: RequestErrorType
    public let errorMessage: String?

    public init(errorType: RequestErrorType,
                errorMessage: String? = nil) {
        self.errorType = errorType
        self.errorMessage = errorMessage
    }
}
