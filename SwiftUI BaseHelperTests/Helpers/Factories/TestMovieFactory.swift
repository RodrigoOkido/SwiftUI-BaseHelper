//
//  TestMovieFactory.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 13/03/24.
//

import Foundation
@testable import SwiftUI_BaseHelper

struct TestMovieFactory {

    static func makeRemoteMovie(
        poster_path: String = "",
        overview: String = "lorem ipsum",
        genre_ids: [Int] = [1, 5, 7],
        id: Int = 777,
        title: String = "Tropa de Elite",
        vote_average: Double = 9.5
    ) -> RemoteMovie {
        RemoteMovie(poster_path: poster_path,
                    overview: overview,
                    genre_ids: genre_ids,
                    id: id,
                    title: title,
                    vote_average: vote_average)
    }

    static func makeMovie(
        poster_path: String = "",
        overview: String = "lorem ipsum",
        genre_ids: [Int] = [1, 5, 7],
        id: Int = 777,
        title: String = "Tropa de Elite",
        vote_average: Double = 9.5
    ) -> Movie {
        Movie(poster_path: poster_path,
              overview: overview,
              genre_ids: genre_ids,
              id: id,
              title: title,
              vote_average: vote_average)
    }
}
