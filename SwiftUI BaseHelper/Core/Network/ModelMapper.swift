//
//  ModelMapper.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/03/24.
//

import Foundation

public protocol ModelMapper {
    associatedtype T
    static func map<T>(_ input: some Codable) throws -> T
}
