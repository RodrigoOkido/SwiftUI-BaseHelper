//
//  RequestResponse.swift
//  Base
//
//  Created by Juan Collin on 10/10/22.
//

import Foundation

enum RequestResponse<D: Codable, E: Codable & Error> {

    case success(D)
    case customError(E)
    case failure(NetworkRequestError)
}
