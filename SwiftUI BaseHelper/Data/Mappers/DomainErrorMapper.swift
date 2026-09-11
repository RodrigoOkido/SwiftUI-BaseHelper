//
//  DomainErrorMapper.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/09/26.
//

import Foundation
import CoreNetworkLayer

nonisolated extension DomainError {

    init(_ error: RequestError) {
        self.init(kind: Kind(error.errorType), message: error.errorMessage)
    }
}

nonisolated extension DomainError.Kind {

    init(_ type: RequestErrorType) {
        self = switch type {
        case .tokenError: .tokenError
        case .badRequest: .badRequest
        case .unauthorized: .unauthorized
        case .forbidden: .forbidden
        case .notFound: .notFound
        case .timeout: .timeout
        case .conflict: .conflict
        case .serverError: .serverError
        case .couldNotMap: .couldNotMap
        case .undefined: .undefined
        }
    }
}
