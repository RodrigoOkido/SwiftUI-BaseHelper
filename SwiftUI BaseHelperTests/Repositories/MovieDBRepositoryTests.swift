//
//  MovieDBRepositoryTests.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 12/03/24.
//

import XCTest
@testable import SwiftUI_BaseHelper

final class MovieDBRepositoryTests: XCTestCase {

    func testInitShouldNotCallNetwork() {
        let (network, _) = makeSUT()
//        XCTAssertEqual(network.completions.count, 0)
    }

    func test_getMovies_WhenAPICallIsSuccessful_ShouldReturnMoviesList() {
        let (network, repository) = makeSUT()
        let remoteMovie1 = TestMovieFactory.makeRemoteMovie()
        let remoteMovie2 = TestMovieFactory.makeRemoteMovie()
        let movie1 = TestMovieFactory.makeMovie()
        let movie2 = TestMovieFactory.makeMovie()
        let expect = XCTestExpectation(description: "test expectation")

        Task {
            let result = await repository.getMovies()
            switch result {
            case .success(let moviesList):
                XCTAssertEqual(moviesList, [movie1, movie2])
            case .failure(let error):
                XCTFail("It should receive valid Scheduled Items")
            }
            expect.fulfill()
        }

        wait(for: [expect], timeout: 2)
    }

    func test_getScheduledItems_WhenAPIFails_ShouldReturnErrorWithReason() {
        let (network, repository) = makeSUT()
        let expect = XCTestExpectation(description: "test expectation")
        let expectedError = RequestError(errorType: .unauthorized, errorMessage: "error message")

        Task {
            let result = await repository.getMovies()
            switch result {
            case .success:
                XCTFail("It should fail")
            case .failure(let error):
                XCTAssertEqual(error.errorType, expectedError.errorType)
                XCTAssertEqual(error.errorMessage, expectedError.errorMessage)
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
    }
}

// MARK: - Helper methods
extension MovieDBRepositoryTests {

    func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (NetworkMock, MovieDBRepository) {
        let network = NetworkMock()
        let movieDBRepository: MovieDBRepository = MovieDBRepository(network: network)
        trackForMemoryLeaks(network, file: file, line: line)
        trackForMemoryLeaks(movieDBRepository, file: file, line: line)
        return (network, movieDBRepository)
    }
}
