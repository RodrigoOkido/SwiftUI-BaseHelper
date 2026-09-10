//
//  JSONCoderTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 10/09/26.
//

import Foundation
import Testing
@testable import CoreNetworkLayer

@Suite("JSONCoder unit tests")
struct JSONCoderTests {

    private struct Movie: Codable, Equatable {
        let title: String
        let voteAverage: Double
    }

    @Test("Test: Encoding then decoding should round trip the value")
    func test_encodeDecode_WhenValueIsCodable_ShouldRoundTrip() throws {

        let coder = JSONCoder()
        let movie = Movie(title: "Tropa de Elite", voteAverage: 9.5)

        let data = try coder.encode(movie)

        #expect(try coder.decode(Movie.self, from: data) == movie)
    }

    @Test("Test: Decoding malformed data should throw")
    func test_decode_WhenDataIsNotValidJSON_ShouldThrow() {

        let coder = JSONCoder()
        let data = Data("not json".utf8)

        #expect(throws: (any Error).self) {
            try coder.decode(Movie.self, from: data)
        }
    }

    @Test("Test: Decoding a payload missing a key should throw")
    func test_decode_WhenKeyIsMissing_ShouldThrow() {

        let coder = JSONCoder()
        let data = Data(#"{"title":"Tropa de Elite"}"#.utf8)

        #expect(throws: (any Error).self) {
            try coder.decode(Movie.self, from: data)
        }
    }

    @Test("Test: A custom encoder strategy should change the produced keys")
    func test_encode_WhenGivenSnakeCaseStrategy_ShouldConvertKeys() throws {

        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let coder = JSONCoder(encoder: encoder)

        let data = try coder.encode(Movie(title: "X", voteAverage: 1))
        let json = try #require(try JSONSerialization.jsonObject(with: data) as? [String: Any])

        #expect(json["vote_average"] != nil)
        #expect(json["voteAverage"] == nil)
    }

    @Test("Test: asDictionary should mirror the encoded payload")
    func test_asDictionary_WhenValueIsEncodable_ShouldReturnMatchingDictionary() throws {

        let dictionary = try #require(Movie(title: "X", voteAverage: 1).asDictionary(coder: JSONCoder()))

        #expect(dictionary["title"] as? String == "X")
        #expect(dictionary["voteAverage"] as? Double == 1)
    }
}
