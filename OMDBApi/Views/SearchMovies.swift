//
//  SearchMovies.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-18.
//

import SwiftUI

/// SearchMovie view for the first tab.
struct SearchMovies: View {
    @State private var searchTerm = ""
    @StateObject private var movieFetcher = MovieAPIService()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchTerm, placeholder: "Search for movies...") { newValue in
                    movieFetcher.fetchMovies(searchTerm: newValue)
                }
                
                Spacer()

                // Conditionally show MovieList view or "No movies found"
                if movieFetcher.movies.isEmpty && searchTerm.count > 0 {
                    VStack {
                        Spacer()
                        Text("No movies were found")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                } else {
                    MovieList(movies: movieFetcher.movies)
                        .onChange(of: searchTerm) {
                            print(movieFetcher.movies)
                        }
                }
            }.navigationTitle("OMDB Movie Search")
        }
    }
}

#Preview {
    SearchMovies()
}
