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
        XCTAssertEqual(network.requestsCounter, 0)
    }

    func test_init_WhenRepositoryStarts_ShouldHaveNoCalledMethodsAndRequestShouldFailSetFalse() {

        let (_, repository) = makeSUT()
        XCTAssertEqual(repository.calledMethods, [])
        XCTAssertFalse(repository.requestShouldFail)
    }

    func test_getMovies_WhenAPICallIsSuccessful_ShouldReturnMoviesList() {
        
        let (_, repository) = makeSUT()
        let movie1 = TestMovieFactory.makeMovie(id: 870)
        let movie2 = TestMovieFactory.makeMovie(id: 910)

        let expect = XCTestExpectation(description: "test expectation")

        Task {
            let result = await repository.getMovies()
            switch result {
            case .success(let moviesList):
                XCTAssertEqual(moviesList[0].id, movie1.id)
                XCTAssertEqual(moviesList[1].id, movie2.id)
                XCTAssertEqual(repository.calledMethods, [.getMovies])
            case .failure(_):
                XCTFail("Request should succeed")
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
    }

    func test_getScheduledItems_WhenAPIFails_ShouldReturnErrorWithReason() {
        
        let (_, repository) = makeSUT()
        repository.requestShouldFail = true

        let expect = XCTestExpectation(description: "test expectation")

        Task {
            let result = await repository.getMovies()
            switch result {
            case .success(_):
                XCTFail("Request should fail")
            case .failure(let error):
                XCTAssertEqual(error.errorType, .badRequest)
                XCTAssertEqual(error.errorMessage, "Test failed successfully")
                XCTAssertEqual(repository.calledMethods, [.getMovies])
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
    ) -> (NetworkMock, MockMovieDBRepository) {
        let network = NetworkMock()
        let movieDBRepository: MockMovieDBRepository = MockMovieDBRepository(network: network)
        trackForMemoryLeaks(network, file: file, line: line)
        trackForMemoryLeaks(movieDBRepository, file: file, line: line)
        return (network, movieDBRepository)
    }
}
