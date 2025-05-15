//
//  FavoriteMovie.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 14/05/25.
//
import SwiftUI
import SwiftData

// This model will be injected using the modifier .modelContainer at SwiftUI_BaseHelperApp
// We will use this to show how we can fetch data direct through View.
@Model
class FavoriteMovie {
    
    var title: String
    var overview: String
    var vote_average: Double?
    
    init(title: String, overview: String, vote_average: Double? = nil) {
        self.title = title
        self.overview = overview
        self.vote_average = vote_average
    }
}
