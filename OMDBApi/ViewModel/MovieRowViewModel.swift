//
//  MovieRowViewModel.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-18.
//

import Foundation
import CoreData
import SwiftUI

/// A ViewModel for the MovieRow view.
class MovieRowViewModel: ObservableObject {
    private let savedMovieHelper = SavedMovieHelper()
    @Published var isSaved: Bool = false
    
    /// Saves a movie to Core Data.
    /// - Parameters:
    ///   - movie: The movie to save.
    ///   - context: The managed object context.
    func saveMovie(movie: Movie, context: NSManagedObjectContext) {
        if isSaved {
            isSaved = !isSaved
            return
        }
        savedMovieHelper.saveMovie(movie: movie, context: context)
        isSaved = true // Update state after saving
        
    }
}
