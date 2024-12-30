//
//  MovieRow.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-17.
//

import SwiftUI

/// MovieRow view represents a single movie row, that includes movie info and save functionality to Core Data.
struct MovieRow: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel = MovieRowViewModel()
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 10) {
            
            // Movie Poster
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3) // Gray placeholder
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            // Movie Info
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.primary) // Movie Title
                Text(movie.year)
                    .font(.subheadline)
                    .foregroundColor(.secondary) // Movie Year
                
                Button( action: {
                    print("\(movie.title), \(movie.year)")
                }) {
                    Text("Details")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                
                
                // Button to save the movie to Core Data
                Button(action: {
                    print("Saving movie: \(movie.title), \(movie.year), \(movie.poster)")
                    viewModel.saveMovie(movie: movie, context: viewContext)
                }) {
                    Label("Save Movie", systemImage: viewModel.isSaved ? "bookmark.fill" : "bookmark")
                        .font(.caption)
                        .foregroundColor(viewModel.isSaved ? .yellow : .blue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    let movie = Movie(id: "123", title: "Batman 1", year: "2020", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg")
    MovieRow(movie: movie)
}
