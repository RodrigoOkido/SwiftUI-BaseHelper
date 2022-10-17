//
//  APIDetailMovieViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 14/10/22.
//

import Foundation


class APIDetailMovieViewModel {
    
    // MARK: - Private Functions
    private func getKeyValue(forKey key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }
    
    // MARK: - Public Functions
    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        guard let configMoviePosterImage = getKeyValue(forKey: "API_URL_POSTER_IMAGE") else { return "" }
        let url_poster_image = "https://\(configMoviePosterImage)\(posterPath)"
        return url_poster_image
    }
}
