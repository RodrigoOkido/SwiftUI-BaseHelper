//
//  MovieDBRepositoryTests.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 12/03/24.
//

import Testing
@testable import SwiftUI_BaseHelper

@Suite("MovieDBRepositoryTests unit tests")
struct MovieDBRepositoryTests {

    @Test("Test: Initialize SUT should not call network")
    func testInitShouldNotCallNetwork() {
        let (network, _) = makeSUT()
        #expect(network.requestsCounter == 0)
    }

    @Test("Test: Initialize SUT should not call network")
    func test_init_WhenRepositoryStarts_ShouldHaveNoCalledMethodsAndRequestShouldFailSetFalse() {

        let (_, repository) = makeSUT()
        #expect(repository.calledMethods.isEmpty)
        #expect(repository.requestShouldFail == false)
    }

    @Test("Test: When calling getMovies() succeeds, should return movies list")
    func test_getMovies_WhenAPICallIsSuccessful_ShouldReturnMoviesList() async {
        
        let (_, repository) = makeSUT()
        let movie1 = TestMovieFactory.makeMovie(id: 870)
        let movie2 = TestMovieFactory.makeMovie(id: 910)

        let result = await repository.getMovies()
        switch result {
        case .success(let moviesList):
            #expect(moviesList[0].id == movie1.id)
            #expect(moviesList[1].id == movie2.id)
            #expect(repository.calledMethods == [.getMovies])
        case .failure(_):
            Issue.record("Request should succeed")
        }
    }

    @Test("Test: When calling getMovies() fails, should return error with reason")
    func test_getMovies_WhenAPIFails_ShouldReturnErrorWithReason() async {
        
        let (_, repository) = makeSUT()
        repository.requestShouldFail = true

        let result = await repository.getMovies()
        switch result {
        case .success(_):
            Issue.record("Request should fail")
        case .failure(let error):
            #expect(error.errorType == .badRequest)
            #expect(error.errorMessage == "Test failed successfully")
            #expect(repository.calledMethods == [.getMovies])
        }
    }
}

// MARK: - Helper methods
extension MovieDBRepositoryTests {

    func makeSUT() -> (NetworkMock, MockMovieDBRepository) {
        let network = NetworkMock()
        let movieDBRepository: MockMovieDBRepository = MockMovieDBRepository(network: network)
        return (network, movieDBRepository)
    }
}
