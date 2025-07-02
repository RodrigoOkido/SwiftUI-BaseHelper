//
//  EnvironmentProtocol.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/03/24.
//

import Foundation

protocol EnvironmentProtocol: AnyObject {

    var infoDictionary: [String: Any] { get }
    var baseURL: String { get }
    var apiKey: String { get }
    var publicKey: String { get }
    var privateKey: String { get }
    
    // MARK: - Functions
    func getValue(forKey key: String) -> String
}
