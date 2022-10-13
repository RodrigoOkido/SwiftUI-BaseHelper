//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation

struct Response: Codable {
    var results: [Movie]
}

class APIViewModel {
    
    @Published private var popularMovies = [Movie]()
    
    func getKeyValue(forKey key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }
    
    func requestPopularMovies() async {
        guard let configURL = getKeyValue(forKey: "API_URL") else { return }
        guard let url = URL(string: "https://\(configURL)") else { return }
       
        do {
            let (data, responseCode) = try await URLSession.shared.data(from: url)
            guard (responseCode as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            popularMovies = decodedResponse.results
            print(popularMovies)
            
            // more code to come
        } catch {
            print("Invalid data")
        }
    }
}
