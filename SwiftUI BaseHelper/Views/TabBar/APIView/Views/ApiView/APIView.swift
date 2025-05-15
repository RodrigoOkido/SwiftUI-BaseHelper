//
//  APIView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem
import SwiftData

enum MovieTabMenu: CaseIterable {
    case movieList, favoriteMovies
    
    var label: String {
        switch self {
        case .movieList: "Movies"
        case .favoriteMovies: "Favorites"
        }
    }
}

struct APIView: View {
    
    // MARK: - Environments
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var router: Router<DestinationView>
    @Query(sort: \FavoriteMovie.title) var favoriteMovies: [FavoriteMovie]

    // MARK: - Stored Properties
    @ObservedObject private var viewModel: APIViewModel
    @State private var selectedBar: MovieTabMenu = .movieList
    @State private var favMovies: [FavoriteMovie] = []
    
    // MARK: - Computed Properties
    private var isDarkModeEnabled: Bool {
        return colorScheme == .dark
    }

    // MARK: - Initializer
    init(viewModel: APIViewModel = APIViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                loadingView
            case .loaded:
                contentView
            case .error:
                errorView
            }
        }
        .navigationTitle("Popular Movies")
        .navigationBarTitleDisplayMode(.large)
        .task {
            do {
                try await viewModel.requestPopularMovies()
            } catch {
                print("Error")
            }
        }
        .alert(isPresented: $viewModel.requestFailed,
               content: { () -> Alert in
                    Alert(title: Text("Error"),
                          message: Text(viewModel.requestFailedMessage),
                          dismissButton: .default(Text("Ok")))
                })
    }
    
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
    
    private var errorView: some View {
        VStack {
            Spacer()
            Text(viewModel.requestFailedMessage)
            Button {
                Task {
                   try await viewModel.requestPopularMovies()
                }
            } label: {
                Text("Refresh")
                    .underline()
            }

            Spacer()
        }
        .onAppear {
            viewModel.requestFailed = true
        }
    }
    
    private var contentView: some View {
        VStack {
            Picker("MovieSelection", selection: $selectedBar) {
                ForEach(MovieTabMenu.allCases, id: \.self) { option in
                    Text(option.label)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            switch selectedBar {
            case .favoriteMovies:
                FavoriteMoviesView()
            case .movieList:
                moviesView
            }
        }
    }
    
    private var moviesView: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.popularMovies, id: \.id) { movie in
                    Button {
                        router.navigate(
                            to: DestinationView.movieDetails(movie: movie)
                        )
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: viewModel.getMoviePosterURL(posterPath: movie.poster_path))) { image in
                                image.resizable()
                            } placeholder: {
                                VStack {
                                    Text(movie.title)
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                }
                            }
                            .frame(width: WidthSize.xxl,
                                   height: HeightSize.huge)
                            .cornerRadius(CornerRadius.sm)
                            VStack(alignment: .leading) {
                                HStack(spacing: 10) {
                                    Text(movie.title)
                                        .bold()
                                        .foregroundColor(isDarkModeEnabled ? .white : .black)
                                    Button {
                                        addOrRemoveMovieFromFavorites(movie: movie)
                                    } label: {
                                        if favoriteMovies.contains(where: { favMovie in
                                            favMovie.title == movie.title
                                        }) {
                                            Image(systemName: "star.fill")
                                        } else {
                                            Image(systemName: "star")
                                        }
                                    }

                                }
                                Text(movie.overview)
                                    .font(.body)
                                    .frame(height: HeightSize.huge)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(isDarkModeEnabled ? .white : .black)
                                Text("Average Score: \(String(format: "%.2f", movie.vote_average))")
                                    .foregroundColor(isDarkModeEnabled ? .white : .black)
                            }
                        }
                    }
                    Divider()
                }
            }
            .padding()
            .onAppear {
                favMovies = favoriteMovies
            }
        }
    }
}

extension APIView {
    
    private func addOrRemoveMovieFromFavorites(movie: Movie) {
        if let _ = favoriteMovies.first(where: { favMovie in
            favMovie.title == movie.title
        }) {
            removeMovieFromFavorites(movie)
        } else {
            let newFavoriteMovie = FavoriteMovie(title: movie.title,
                                                 overview: movie.overview)
            modelContext.insert(newFavoriteMovie)
            favMovies.append(newFavoriteMovie)
        }
        try? modelContext.save()
    }
    
    private func removeMovieFromFavorites(_ movie: Movie) {
        if let index = favoriteMovies.firstIndex(where: { favMovie in
            favMovie.title == movie.title
        }) {
            modelContext.delete(favoriteMovies[index])
            favMovies.remove(at: index)
        }
        try? modelContext.save()
    }
}

#Preview {
    APIView()
}
