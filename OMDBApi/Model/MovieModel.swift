//
//  MovieModel.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-16.
//

import Foundation


struct MovieResponse: Decodable {
    let search: [Movie]
    
    /// Maps the "Search" field from the API to the `search` property.
    enum CodingKeys: String, CodingKey{
        case search = "Search"
    }
}

struct Movie: Identifiable, Decodable{
    let id: String
    let title: String
    let year: String
    let poster: String
    
    
    /// Maps API fields from the API to Swift property names.
    enum CodingKeys: String, CodingKey{
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}


