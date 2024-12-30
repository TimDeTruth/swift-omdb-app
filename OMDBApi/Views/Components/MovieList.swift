//
//  MovieList.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-17.
//

import SwiftUI

/// MovieList view that displays a vertical scrollable list of MovieRow views.
struct MovieList: View {
    let movies: [Movie]
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(movies) { movie in
                    MovieRow(movie: movie) 
                    .padding()
                    Divider()
                }
                Spacer()
                    .frame(height: 80)
            }
        }
    }
}


#Preview {
    let movieList = [
        Movie(id: "1", title: "Batman 1", year: "2020", poster: "https://m.media-amazon.com/images/M/MV5BODIyMDdhNTgtNDlmOC00MjUxLWE2NDItODA5MTdkNzY3ZTdhXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "2", title: "Batman 2", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BODIyMDdhNTgtNDlmOC00MjUxLWE2NDItODA5MTdkNzY3ZTdhXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "3", title: "Batman 3", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BODIyMDdhNTgtNDlmOC00MjUxLWE2NDItODA5MTdkNzY3ZTdhXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "4", title: "Batman 4", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "5", title: "Batman 5", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "6", title: "Batman 6", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "7", title: "Batman 7", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "8", title: "Batman 8", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "9", title: "Batman 9", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg"),
        Movie(id: "10", title: "Batman 10", year: "2021", poster: "https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg")
    ]
    MovieList(movies: movieList)
}
