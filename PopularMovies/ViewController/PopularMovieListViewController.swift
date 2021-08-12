//
//  PopularMovieListViewController.swift
//  PopularMovies
//
//  Created by Tifo Audi Alif Putra on 11/08/21.
//

import UIKit

final class PopularMovieListViewController: UITableViewController {
    
    private let viewModel: PopularMovieListViewModel
    
    init(viewModel: PopularMovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchMovies()
        bindViewModelEvent()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 120.0
        tableView.register(
            PopularMovieCell.self,
            forCellReuseIdentifier: PopularMovieCell.cellIdentifier
        )
    }
    
    private func fetchMovies() {
        viewModel.fetchMovie()
    }
    
    private func bindViewModelEvent() {
        viewModel.onFetchMovieSucceed = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.onFetchMovieFailure = { error in
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieCell.cellIdentifier, for: indexPath) as? PopularMovieCell else {
            return UITableViewCell()
        }
        
        let movie = viewModel.movies[indexPath.row]
        cell.bindViewWith(
            viewModel: PopularMovieDefaultViewModel(
                movie: movie
            )
        )
        
        return cell
    }
}

