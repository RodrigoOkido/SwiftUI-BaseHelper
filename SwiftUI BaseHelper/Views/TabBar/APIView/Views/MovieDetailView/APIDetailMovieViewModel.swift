//
//  APIDetailMovieViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 14/10/22.
//

import Foundation

class APIDetailMovieViewModel: BaseViewModel {
    
    @Injected var environment: EnvironmentProtocol

    // MARK: - Stored properties
    var movie: Movie

    // MARK: - Initializer
    init(movie: Movie) {
        self.movie = movie
    }
    
    // MARK: - Public Functions
    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        let posterBaseUrl = environment.getValue(forKey: "API_URL_POSTER_IMAGE")
        let url_poster_image = "https://\(posterBaseUrl)\(posterPath)"
        return url_poster_image
    }
}
