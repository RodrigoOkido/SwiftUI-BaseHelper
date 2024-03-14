//
//  RemoteMovie.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 06/03/24.
//

import Foundation

public struct RemoteMovies: Codable {

    var results: [RemoteMovie]

    public init(results: [RemoteMovie]) {
        self.results = results
    }
}

public struct RemoteMovie: Codable, Hashable {

    var poster_path: String?
    var overview: String?
    var genre_ids: [Int]?
    var id: Int
    var title: String?
    var vote_average: Double?

    public init(poster_path: String? = nil, 
                overview: String? = nil,
                genre_ids: [Int]? = nil,
                id: Int,
                title: String? = nil,
                vote_average: Double? = nil) {
        self.poster_path = poster_path
        self.overview = overview
        self.genre_ids = genre_ids
        self.id = id
        self.title = title
        self.vote_average = vote_average
    }
}
