//
//  PopularMovieViewModel.swift
//  PopularMovies
//
//  Created by Tifo Audi Alif Putra on 11/08/21.
//

import Foundation

protocol PopularMovieViewModel {
    var onFetchMovieSucceed: (([Movie]) -> Void)? { set get }
    func fetchMovie()
}

final class PopularMovieDefaultViewModel: PopularMovieViewModel {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    var onFetchMovieSucceed: (([Movie]) -> Void)?
    
    func fetchMovie() {
        
    }
}
