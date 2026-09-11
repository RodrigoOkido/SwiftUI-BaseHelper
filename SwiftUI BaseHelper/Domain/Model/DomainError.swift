//
//  DomainError.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 11/09/26.
//

import Foundation

/// Failure vocabulary owned by the domain. Repositories translate whatever their data source
/// produces into this type, so view models and views never depend on a transport package.
nonisolated struct DomainError: Error, Equatable {

    enum Kind: Equatable {
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

    // MARK: - Public Properties
    let kind: Kind
    let message: String?

    // MARK: - Initializer
    init(kind: Kind, message: String? = nil) {
        self.kind = kind
        self.message = message
    }
}
