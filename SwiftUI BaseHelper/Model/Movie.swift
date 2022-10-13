//
//  Movie.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation

struct Movie: Codable, Hashable {
    var poster_path: String
    var overview: String
    var genres_ids: [Int] // Genres is defined by its IDs in the TMDB Movies API
    var id: Int
    var title: String
    var vote_average: Double
}
