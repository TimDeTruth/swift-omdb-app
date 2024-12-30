//
//  ContentView.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-14.
//

import SwiftUI
import CoreData

/// ContentView, render the initial view of the OMDB API app.
struct ContentView: View {
    var body: some View {
        TabView {
            SearchMovies()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            SavedMovies()
                .tabItem {
                    Label("Saved", systemImage: "bookmark.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
