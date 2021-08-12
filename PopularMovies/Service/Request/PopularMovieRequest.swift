//
//  PopularMovieRequest.swift
//  PopularMovies
//
//  Created by Tifo Audi Alif Putra on 11/08/21.
//

import Foundation

struct PopularMovieRequest: DataRequest {
    
    private let apiKey: String = "register API key by yourself :]"

    var url: String {
        let baseURL: String = "https://api.themoviedb.org/3"
        let path: String = "/movie/popular"
        return baseURL + path
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [
            "api_key": apiKey
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Movie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(MoviesResponse.self, from: data)
        return response.results
    }
}
