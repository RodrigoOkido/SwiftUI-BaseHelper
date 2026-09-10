//
//  HTTPVerbTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 09/09/26.
//

import Testing
@testable import CoreNetworkLayer

@Suite("HTTPVerb unit tests")
struct HTTPVerbTests {

    @Test("Query is used by the verbs that carry no body",
          arguments: [(HTTPVerb.GET, true),
                      (HTTPVerb.DELETE, true),
                      (HTTPVerb.POST, false),
                      (HTTPVerb.PUT, false),
                      (HTTPVerb.PATCH, false)])
    func test_shouldUseQuery_forEachVerb_shouldMatchTable(verb: HTTPVerb, expected: Bool) {
        #expect(verb.shouldUseQuery == expected)
    }

    @Test("Body is used by the mutating verbs",
          arguments: [(HTTPVerb.POST, true),
                      (HTTPVerb.PUT, true),
                      (HTTPVerb.PATCH, true),
                      (HTTPVerb.GET, false),
                      (HTTPVerb.DELETE, false)])
    func test_shouldUseBody_forEachVerb_shouldMatchTable(verb: HTTPVerb, expected: Bool) {
        #expect(verb.shouldUseBody == expected)
    }

    @Test("A verb never sends a query and a body at the same time")
    func test_queryAndBody_shouldBeMutuallyExclusive() {
        for verb in [HTTPVerb.GET, .POST, .PUT, .PATCH, .DELETE] {
            #expect(verb.shouldUseQuery != verb.shouldUseBody)
        }
    }
}
