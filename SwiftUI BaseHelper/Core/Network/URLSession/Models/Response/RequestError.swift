//
//  RequestError.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

//import Foundation
//
//struct RequestError: Codable, Error, Equatable {
//
//    var statusCode: Int
//    var errorMessage: String
//}
//
//// MARK: Static Helpers
//extension RequestError {
//
//    static let internalError = RequestError(statusCode: 400,
//                                            errorMessage: "network.internalError".localized)
//    static let noConnectionError = RequestError(statusCode: 503,
//                                                errorMessage: "network.noInternetConnection".localized)
//
//    static let couldNotMapError = RequestError(statusCode: 400, errorMessage: "network.couldNotMap".localized)
//}

//
//  RequestError.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public enum RequestErrorType: Error, Equatable {
    case tokenError
    case notAllowed
    case timeout
    case notFound
    case serverError
    case couldNotMap
    case invalidRequest
    case undefined
    case forbidden
    case conflict
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

