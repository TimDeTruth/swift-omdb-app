//
//  SavedMoviesViewModel.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-18.
//

import Foundation
import CoreData
import SwiftUI

/// A ViewModel for the SavedMovies view.
class SavedMoviesViewModel: ObservableObject {
    private let savedMovieHelper = SavedMovieHelper()
    @Published var savedMovies: [SavedMovie] = []
    @Published var isSaved: Bool = true

    
    /// Fetches saved movies from Core Data.
    func fetchSavedMovies(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<SavedMovie> = SavedMovie.fetchRequest()
        
        do {
            savedMovies = try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch movies: \(error.localizedDescription)")
        }
    }
    
    /// Delete a movie from Core Data.
    /// - Parameters:
    ///   - savedMovie: The savedMovie to delete from Core Data.
    ///   - context: The managed object context.
    func deleteMovie(savedMovie: SavedMovie, context: NSManagedObjectContext) {
        savedMovieHelper.deleteMovie(savedMovie: savedMovie, context: context)
        fetchSavedMovies(context: context) // Refetch movies after deletion
    }
}

