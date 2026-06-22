//
//  APIDetailMovieViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 14/10/22.
//

import Foundation
import SwiftUI

@Observable
class APIDetailMovieViewModel: BaseViewModel {
    
    // MARK: - Public Properties
    var movie: Movie

    // MARK: - Initializer
    init(movie: Movie) {
        self.movie = movie
    }
}
