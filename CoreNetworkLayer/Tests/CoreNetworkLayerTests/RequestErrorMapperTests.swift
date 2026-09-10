//
//  RequestErrorMapperTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 09/09/26.
//

import Testing
@testable import CoreNetworkLayer

@Suite("RequestErrorMapper unit tests")
struct RequestErrorMapperTests {

    @Test("Every mapped status code",
          arguments: [(400, RequestErrorType.badRequest),
                      (401, RequestErrorType.unauthorized),
                      (403, RequestErrorType.forbidden),
                      (404, RequestErrorType.notFound),
                      (408, RequestErrorType.timeout),
                      (409, RequestErrorType.conflict),
                      (500, RequestErrorType.serverError),
                      (503, RequestErrorType.serverError),
                      (599, RequestErrorType.serverError),
                      (418, RequestErrorType.undefined),
                      (302, RequestErrorType.undefined)])
    func test_map_whenGivenStatusCode_shouldReturnMatchingErrorType(statusCode: Int,
                                                                    expected: RequestErrorType) {

        let result = RequestErrorMapper.map(NetworkRequestError(statusCode: statusCode))

        #expect(result.errorType == expected)
    }

    @Test
    func test_map_whenIsTokenError_shouldReturnTokenErrorRegardlessOfStatusCode() {

        let input = NetworkRequestError(statusCode: 404,
                                        error: "expired",
                                        isTokenError: true)

        let result = RequestErrorMapper.map(input)

        #expect(result.errorType == .tokenError)
        #expect(result.errorMessage == "expired")
    }

    @Test
    func test_map_whenStatusCodeIsNil_shouldReturnUndefined() {

        let result = RequestErrorMapper.map(NetworkRequestError(error: "no status"))

        #expect(result.errorType == .undefined)
        #expect(result.errorMessage == "no status")
    }

    @Test
    func test_map_shouldForwardServerMessage() {

        let result = RequestErrorMapper.map(NetworkRequestError(statusCode: 400,
                                                                error: "Bad body"))

        #expect(result.errorMessage == "Bad body")
    }

    @Test("Equality ignores the message, so only the failure kind is compared")
    func test_equality_whenErrorTypesMatchButMessagesDiffer_shouldBeEqual() {

        #expect(RequestError(errorType: .notFound, errorMessage: "a")
                == RequestError(errorType: .notFound, errorMessage: "b"))

        #expect(RequestError(errorType: .notFound) != RequestError(errorType: .conflict))
    }
}
