//
//  MovieMapperTests.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 10/09/26.
//

import Testing
import CoreNetworkLayer
@testable import SwiftUI_BaseHelper

@Suite("MovieMapper unit tests")
struct MovieMapperTests {

    private let imageBaseURL = "https://image.tmdb.org/t/p/w500"

    @Test("Test: When every field comes filled, should map all of them")
    func test_map_WhenEveryFieldIsPresent_ShouldMapAllOfThem() throws {

        let input = RemoteMovie(poster_path: "/abc.jpg",
                                overview: "lorem ipsum",
                                genre_ids: [28, 12],
                                id: 870,
                                title: "Tropa de Elite",
                                vote_average: 9.5)

        let movie: Movie = try MovieMapper.map(input)

        #expect(movie.poster_path == "\(imageBaseURL)/abc.jpg")
        #expect(movie.overview == "lorem ipsum")
        #expect(movie.genre_ids == [28, 12])
        #expect(movie.id == 870)
        #expect(movie.title == "Tropa de Elite")
        #expect(movie.vote_average == 9.5)
    }

    @Test("Test: When poster path exists, should prefix the image base URL")
    func test_map_WhenPosterPathExists_ShouldPrefixImageBaseURL() throws {

        let movie: Movie = try MovieMapper.map(RemoteMovie(poster_path: "/xyz.jpg", id: 1))

        #expect(movie.poster_path == "\(imageBaseURL)/xyz.jpg")
    }

    @Test("Test: When poster path is nil, should keep the poster nil")
    func test_map_WhenPosterPathIsNil_ShouldKeepPosterNil() throws {

        let movie: Movie = try MovieMapper.map(RemoteMovie(poster_path: nil, id: 1))

        #expect(movie.poster_path == nil)
    }

    @Test("Test: When poster path is empty, should still build a prefixed URL")
    func test_map_WhenPosterPathIsEmpty_ShouldStillBuildPrefixedURL() throws {

        let movie: Movie = try MovieMapper.map(RemoteMovie(poster_path: "", id: 1))

        #expect(movie.poster_path == imageBaseURL)
    }

    @Test("Test: When overview is nil, should fall back to the default text")
    func test_map_WhenOverviewIsNil_ShouldUseDefaultText() throws {

        let movie: Movie = try MovieMapper.map(RemoteMovie(overview: nil, id: 1))

        #expect(movie.overview == "No overview data")
    }

    @Test("Test: When title is nil, should fall back to the default text")
    func test_map_WhenTitleIsNil_ShouldUseDefaultText() throws {

        let movie: Movie = try MovieMapper.map(RemoteMovie(id: 1, title: nil))

        #expect(movie.title == "No title")
    }

    @Test("Test: When genre ids are nil, should fall back to an empty list")
    func test_map_WhenGenreIdsAreNil_ShouldUseEmptyList() throws {

        let movie: Movie = try MovieMapper.map(RemoteMovie(genre_ids: nil, id: 1))

        #expect(movie.genre_ids.isEmpty)
    }

    @Test("Test: When vote average is nil, should fall back to zero")
    func test_map_WhenVoteAverageIsNil_ShouldUseZero() throws {

        let movie: Movie = try MovieMapper.map(RemoteMovie(id: 1, vote_average: nil))

        #expect(movie.vote_average == 0)
    }

    @Test("Test: When input is not a RemoteMovie, should throw couldNotMap")
    func test_map_WhenInputIsNotARemoteMovie_ShouldThrowCouldNotMap() {

        let error = #expect(throws: RequestError.self) {
            let _: Movie = try MovieMapper.map(RemoteMovies(results: []))
        }

        #expect(error?.errorType == .couldNotMap)
    }
}

@Suite("MoviesMapper unit tests")
struct MoviesMapperTests {

    @Test("Test: Should map every result and keep their order")
    func test_map_WhenGivenSeveralResults_ShouldMapAllOfThemInOrder() throws {

        let input = RemoteMovies(results: [RemoteMovie(id: 870, title: "First"),
                                           RemoteMovie(id: 910, title: "Second")])

        let movies: [Movie] = try MoviesMapper.map(input)

        #expect(movies.count == 2)
        #expect(movies.map(\.id) == [870, 910])
        #expect(movies.map(\.title) == ["First", "Second"])
    }

    @Test("Test: Should apply the single mapper defaults to every result")
    func test_map_WhenResultsHaveMissingFields_ShouldApplyDefaults() throws {

        let input = RemoteMovies(results: [RemoteMovie(id: 1)])

        let movies: [Movie] = try MoviesMapper.map(input)

        #expect(movies.first?.overview == "No overview data")
        #expect(movies.first?.title == "No title")
        #expect(movies.first?.vote_average == 0)
        #expect(movies.first?.genre_ids.isEmpty == true)
    }

    @Test("Test: When there are no results, should return an empty list")
    func test_map_WhenThereAreNoResults_ShouldReturnEmptyList() throws {

        let movies: [Movie] = try MoviesMapper.map(RemoteMovies(results: []))

        #expect(movies.isEmpty)
    }

    @Test("Test: When input is not a RemoteMovies, should throw couldNotMap")
    func test_map_WhenInputIsNotARemoteMovies_ShouldThrowCouldNotMap() {

        let error = #expect(throws: RequestError.self) {
            let _: [Movie] = try MoviesMapper.map(RemoteMovie(id: 1))
        }

        #expect(error?.errorType == .couldNotMap)
    }
}
