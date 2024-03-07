//
//  SimpleRequestResponse.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

enum SimpleRequestResponse<E: Codable & Error> {

    case success
    case customError(E)
    case failure(NetworkRequestError)
}
