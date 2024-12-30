//
//  savedMoviesHelper.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-18.
//

import Foundation
import CoreData

/// A helper class to manage movies in Core Data.
class SavedMovieHelper {
    
    /// Saves a movie to Core Data.
    /// - Parameters:
    ///   - movie: The movie to save.
    ///   - context: The managed object context for Core Data.
    func saveMovie(movie: Movie, context: NSManagedObjectContext) {
        let newSavedMovie = SavedMovie(context: context)
        newSavedMovie.title = movie.title
        newSavedMovie.year = movie.year
        newSavedMovie.poster = movie.poster
        
        do {
            try context.save()
            print("Movie saved successfully!")
        } catch {
            print("Failed to save movie: \(error.localizedDescription)")
        }
    }
    
    /// Deletes a specific movie from Core Data.
    /// - Parameters:
    ///   - savedMovie: The specific movie to delete.
    ///   - context: The managed object context for Core Data.
    func deleteMovie(savedMovie: SavedMovie, context: NSManagedObjectContext) {
        context.delete(savedMovie)
        
        do {
            try context.save()
            print("Movie deleted successfully!")
            
        } catch {
            print("Failed to delete movie: \(error.localizedDescription)")
        }
    }
    
}
