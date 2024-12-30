//
//  SavedMovies.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-17.
//

import SwiftUI

import SwiftUI
import CoreData

/// SavedMovies view for the second tab.
struct SavedMovies: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel = SavedMoviesViewModel()

    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.savedMovies, id: \.self) { savedMovie in
                    HStack {

                        AsyncImage(url: URL(string: savedMovie.poster ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(savedMovie.title ?? "Unknown Title")
                                .font(.headline)
                            Text(savedMovie.year ?? "Unknown Year")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let savedMovie = viewModel.savedMovies[index]
                        viewModel.deleteMovie(savedMovie: savedMovie, context: viewContext)
                    }
                }
            }
            .navigationTitle("Saved Movies")
            .onAppear {
                viewModel.fetchSavedMovies(context: viewContext)
            }
        }
    }
}

#Preview {
    let previewContext = PersistenceController.shared.container.viewContext
    
     let savedMovie = SavedMovie(context: previewContext)
    savedMovie.title = "Batman"
    savedMovie.year = "2024"
    savedMovie.poster = "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg"
    
    return SavedMovies()
        .environment(\.managedObjectContext, previewContext)
}

