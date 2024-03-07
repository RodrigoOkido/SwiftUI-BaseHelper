//
//  HTTPMethod.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

enum HTTPMethod: String {

    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"

    var shouldUseQuery: Bool {
        switch self {
        case .get:
            return true
        case .post:
            return false
        case .put:
            return false
        case .patch:
            return false
        case .delete:
            return true
        }
    }

    var shouldUseBody: Bool {
        switch self {
        case .get:
            return false
        case .post:
            return true
        case .put:
            return true
        case .patch:
            return true
        case .delete:
            return false
        }
    }
}
