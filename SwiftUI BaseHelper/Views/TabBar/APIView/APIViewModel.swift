//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import UIKit

struct Response: Codable {
    var results: [Movie]
}

class APIViewModel {
    
    @Published var popularMovies = [Movie]()
    
    private func getKeyValue(forKey key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }
    
    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        guard let configMoviePosterImage = getKeyValue(forKey: "API_URL_POSTER_IMAGE") else { return "" }
        let url_poster_image = "https://\(configMoviePosterImage)\(posterPath)"
        return url_poster_image
    }
    
    func requestPopularMovies() async throws -> [Movie]{
        guard let configURL = getKeyValue(forKey: "API_URL") else { return [] }
        guard let url = URL(string: "https://\(configURL)") else { return [] }
       
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            popularMovies = decodedResponse.results
            return popularMovies
        } catch {
            print("Invalid Data")
            return []
        }
    }
}
