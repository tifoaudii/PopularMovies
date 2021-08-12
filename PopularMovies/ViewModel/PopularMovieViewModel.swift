//
//  PopularMovieViewModel.swift
//  PopularMovies
//
//  Created by Tifo Audi Alif Putra on 11/08/21.
//

import UIKit

protocol PopularMovieViewModel {
    var movie: Movie { set get }
}

final class PopularMovieDefaultViewModel: PopularMovieViewModel {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
