//
//  ModelMapper.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/03/24.
//

import Foundation

// Protocol used to map object that comes from server into our domain object.
public protocol ModelMapper {

    associatedtype T
    static func map<T>(_ input: some Codable) throws -> T
}
