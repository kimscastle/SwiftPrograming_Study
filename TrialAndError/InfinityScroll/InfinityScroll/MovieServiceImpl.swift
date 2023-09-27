//
//  MovieServiceImpl.swift
//  InfinityScroll
//
//  Created by uiskim on 2023/09/26.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case urlEncodingError
}


let APIKey = "1862a0edf74034806700802061bd0ce4"
let Bearer = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxODYyYTBlZGY3NDAzNDgwNjcwMDgwMjA2MWJkMGNlNCIsInN1YiI6IjY0NWM4ODNkZmUwNzdhNWNhZWRhZWQ4YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.db1_bgt_zTKnlJyrV1nPNSiEjqmDTqDaE3q-DadmAoQ"

struct MovieServiceImpl: MovieService {
    func getMovieData(page: Int) async throws -> [MovieAppData] {
        
        var urlComponent = URLComponents(string: "https://api.themoviedb.org/3/tv/popular")
        let apiKey = URLQueryItem(name: "api_key", value: APIKey)
        let page = URLQueryItem(name: "page", value: String(page))
        let language = URLQueryItem(name: "language", value: "en-US")
        urlComponent?.queryItems = [apiKey, language, page]
        
        guard let urlRequetURL = urlComponent?.url else {
            throw NetworkError.urlEncodingError
        }
        
        let urlRequest = URLRequest(url: urlRequetURL)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        guard let decodedData = try? JSONDecoder().decode(TMDB.self, from: data) else {
            throw NetworkError.decodeError
        }
        
        return decodedData.results.map{ MovieAppData(title: $0.name, data: $0.firstAirDate) }
    }
}
