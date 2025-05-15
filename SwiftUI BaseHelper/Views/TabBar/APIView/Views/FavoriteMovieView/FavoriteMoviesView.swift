//
//  FavoriteMoviesView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 14/05/25.
//
import SwiftUI
import SwiftData
import DesignSystem

struct FavoriteMoviesView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.modelContext) var modelContext
    @Query(sort: \FavoriteMovie.title) var favoriteMovies: [FavoriteMovie]
    
    @State var searchText: String = ""
    @State var searchMovieResult: [FavoriteMovie] = []
    
    var body: some View {
        if favoriteMovies.isEmpty {
            VStack {
                Spacer()
                Text("No movies added to favorites")
                Spacer()
            }
        } else {
            VStack {
                VStack(alignment: .leading) {
                    Text("Search a movie:")
                        .bold()
                    TextField("Movie name",
                              text: $searchText)
                        .padding(InsetSpacing.quarck)
                        .background(.gray)
                        .cornerRadius(CornerRadius.quarck)
                }
                .padding()
                List(searchText.isEmpty ? favoriteMovies :  searchMovieResult) { movie in
                    Text(movie.title)
                }
            }
            .onChange(of: searchText) { _, _ in
                searchMyFavorites()
            }
        }
    }
}

extension FavoriteMoviesView {
    
    func searchMyFavorites() {
        let searchFavoritePredicate = #Predicate<FavoriteMovie> {
            $0.title.contains(searchText)
        }
        let descriptor = FetchDescriptor<FavoriteMovie>(predicate: searchFavoritePredicate)
        do {
            searchMovieResult = try modelContext.fetch(descriptor)
        } catch {
            print("error")
        }
    }
}
