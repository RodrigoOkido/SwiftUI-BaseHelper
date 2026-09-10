//
//  HTTPVerbTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 10/09/26.
//

import Testing
@testable import CoreNetworkLayer

@Suite("HTTPVerb unit tests")
struct HTTPVerbTests {

    @Test("Test: Query should be used by the verbs that carry no body")
    func test_shouldUseQuery_ForEachVerb_ShouldMatchTable() {

        let expected: [(HTTPVerb, Bool)] = [(.GET, true),
                                            (.DELETE, true),
                                            (.POST, false),
                                            (.PUT, false),
                                            (.PATCH, false)]

        for (verb, isExpected) in expected {
            #expect(verb.shouldUseQuery == isExpected, "\(verb.rawValue)")
        }
    }

    @Test("Test: Body should be used by the mutating verbs")
    func test_shouldUseBody_ForEachVerb_ShouldMatchTable() {

        let expected: [(HTTPVerb, Bool)] = [(.POST, true),
                                            (.PUT, true),
                                            (.PATCH, true),
                                            (.GET, false),
                                            (.DELETE, false)]

        for (verb, isExpected) in expected {
            #expect(verb.shouldUseBody == isExpected, "\(verb.rawValue)")
        }
    }

    @Test("Test: A verb should never send query and body at the same time")
    func test_queryAndBody_ForEachVerb_ShouldBeMutuallyExclusive() {

        for verb in [HTTPVerb.GET, .POST, .PUT, .PATCH, .DELETE] {
            #expect(verb.shouldUseQuery != verb.shouldUseBody, "\(verb.rawValue)")
        }
    }
}
