//
//  Movie.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation

struct Movie: Codable, Hashable {
    var id: Int
    var title: String
    var genres: [Int] // Genres is defined by its IDs in the TMDB Movies API
    var description: String
    var image: String
    var rating_average: Double
}
