//
//  Movie.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation

struct Movie: Hashable {
    var poster_path: String?
    var overview: String
    var genre_ids: [Int]
    var id: Int
    var title: String
    var vote_average: Double
}
