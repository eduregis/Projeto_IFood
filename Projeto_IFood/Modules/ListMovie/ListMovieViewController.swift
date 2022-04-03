//
//  ListMovieViewController.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 02/04/22.
//

import UIKit
import Foundation

class ListMovieViewController: UIViewController {
    
    var viewModel: ListMovieViewModelType!
    var tableView = UITableView()
    let searchController = UISearchController()
    
    var actualSearchText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.IDENTIFIER)
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        
        self.view.addSubview(tableView)
        self.tableView.tableFooterView = UIView()
        self.title = "List"
        
        self.hideKeyboardWhenTappedAround()
        configureConstraints()
        viewModel.fetchMovies(searchText: "")
    }
    
    func configureConstraints() {
        tableView.contentOffset = CGPoint(x: -18, y: -18)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ListMovieViewController: ListMovieViewModelOutput {
    func reloadDisplayData() {
        tableView.reloadData()
    }
}

extension ListMovieViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModel.generateCell(for: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.viewModel = MovieDetailViewModel()
        movieDetailViewController.viewModel.output = movieDetailViewController
        
        movieDetailViewController.viewModel.movie = viewModel.listMovies![indexPath.row]

        self.present(movieDetailViewController, animated: true, completion: nil)
    }
}

extension ListMovieViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        self.actualSearchText = searchText
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if self.actualSearchText == searchText {
                self.viewModel.fetchMovies(searchText: searchText)
            }
        }
    }
}
