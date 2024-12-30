//
//  MovieAPIService.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-14.
//


import Foundation
import Combine

///  Movie API service to fetch movies from OMDB API
class MovieAPIService: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchTerm: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    private let baseURL = "https://www.omdbapi.com/"
    private var apiKey: String{
        let key = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "No API key"
        return key
    }
    
    init() {
        setupSearchTermPublisher()
    }
    
  
    /// Combine debouncer to reduce api calls for searchTerm
    private func setupSearchTermPublisher() {
        $searchTerm
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main) // Debounce for 500ms
            .removeDuplicates()
            .sink { [weak self] newSearchTerm in
                self?.fetchMovies(searchTerm: newSearchTerm)
            } //Subscriber listens to searchTerm and calls fetchMovies after debounce
            .store(in: &cancellables)// cleanup
    }
    
    /// Fetches movies from OMDB API based on the search term.
    /// - Parameter searchTerm: The term to search movie for.
    func fetchMovies(searchTerm: String) {
        guard !searchTerm.isEmpty else {
            self.movies = []
            return
        }
        
        let urlString = "\(baseURL)?apikey=\(apiKey)&s=\(searchTerm)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching movies: \(error)")
                return
            }
            
            guard let data = data else { return }
            print("The data: \(data)")
            
            let decoder = JSONDecoder()
    
            do {
                let response = try decoder.decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    self.movies = response.search
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
