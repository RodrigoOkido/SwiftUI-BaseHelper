//
//  Movie.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation

public struct Movie: Hashable {
    var poster_path: String?
    var overview: String
    var genre_ids: [Int]
    var id: Int
    var title: String
    var vote_average: Double

    public init(poster_path: String? = nil, 
                overview: String,
                genre_ids: [Int], 
                id: Int, 
                title: String,
                vote_average: Double) {
        self.poster_path = poster_path
        self.overview = overview
        self.genre_ids = genre_ids
        self.id = id
        self.title = title
        self.vote_average = vote_average
    }
}
