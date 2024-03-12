//
//  RequestError.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public enum RequestErrorType: Error, Equatable {
    
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

public class RequestError: Error, Equatable {
    
    public static func == (lhs: RequestError, rhs: RequestError) -> Bool {
        lhs.errorType == rhs.errorType
    }

    public var errorType: RequestErrorType
    public var errorMessage: String?

    public init(errorType: RequestErrorType,
                errorMessage: String? = nil) {
        self.errorType = errorType
        self.errorMessage = errorMessage
    }
}

