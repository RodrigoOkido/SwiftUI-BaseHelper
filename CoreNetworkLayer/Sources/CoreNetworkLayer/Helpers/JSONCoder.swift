//
//  JSONCoder.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 10/09/26.
//
import Foundation


public final class JSONCoder: Sendable {

    // MARK: - Private Properties
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    // MARK: - Initializer
    public init(encoder: JSONEncoder = JSONEncoder(),
                decoder: JSONDecoder = JSONDecoder()) {
        self.encoder = encoder
        self.decoder = decoder
    }

    // MARK: - Public Methods
    public func encode(_ value: some Encodable) throws -> Data {
        return try encoder.encode(value)
    }

    public func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        return try decoder.decode(type, from: data)
    }
}
