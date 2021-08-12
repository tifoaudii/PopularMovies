//
//  PopularMovieCell.swift
//  PopularMovies
//
//  Created by Tifo Audi Alif Putra on 11/08/21.
//

import UIKit

final class PopularMovieCell: UITableViewCell {
    
    static let cellIdentifier = "PopularMovieCellIdentifier"
    
    private let container = UIView()
    private let movieImageView = UIImageView()
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(container)
        contentView.addSubview(movieImageView)
        
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 4
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        
        overviewLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        overviewLabel.adjustsFontForContentSizeCategory = true
        overviewLabel.numberOfLines = 0
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let movieLabelStackView = UIStackView(arrangedSubviews: [titleLabel, overviewLabel])
        movieLabelStackView.axis = .vertical
        movieLabelStackView.alignment = .top
        movieLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(movieLabelStackView)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            movieImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            movieImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            movieImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            movieImageView.widthAnchor.constraint(equalToConstant: 90),
            
            movieLabelStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            movieLabelStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            movieLabelStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            movieLabelStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
        ])
    }
    
    func bindViewWith(viewModel: PopularMovieViewModel) {
        let movie = viewModel.movie
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        ImageClient.shared.setImage(from: movie.posterURL, placeholderImage: nil) { [weak self] image in
            self?.movieImageView.image = image
        }
    }
}
