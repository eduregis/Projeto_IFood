//
//  ListViewModel.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 02/04/22.
//

import Foundation

protocol ListMovieViewModelType {
    var output: ListMovieViewModelOutput? { get set }
    var listMovies: [Movie]? { get set }
    
    func fetchMovies(searchText: String)
    func numberOfRows() -> Int
    func cellText(index: Int) -> String
}

protocol ListMovieViewModelOutput: AnyObject {
    func reloadDisplayData()
}

final class ListMovieViewModel {
    let repository: ApiServiceProtocol
    
    public weak var output: ListMovieViewModelOutput?
    var listMovies: [Movie]? = []
    
    init(repository: ApiServiceProtocol = ApiService()) {
        self.repository = repository
    }
}

extension ListMovieViewModel: ListMovieViewModelType {
    
    func fetchMovies(searchText: String) {
        self.getListMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let listMovies):
//                self.listMovies = listMovies.sorted(by: { $0.code < $1.code })
                self.listMovies = listMovies
//                if searchText != "" {
//                    self.listMovies = self.listMovies?.filter { quote in
//                        return (quote.code.uppercased().contains(searchText.uppercased()) || quote.description.uppercased().contains(searchText.uppercased()))
//                    }
//                }
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.output?.reloadDisplayData()
                }
            case .failure: break
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.listMovies?.count ?? 0
    }
    
    func cellText(index: Int) -> String {
        return "\(self.listMovies![index].title)"
    }
    
    func getListMovies(completion: @escaping (Result<[Movie], ApiServiceError>) -> Void) {
        repository.getListMovies { response in
            switch response {
            case .success(let listMovies):
                var movies: [Movie] = []
                for movie in listMovies {
                    movies.append(movie)
                }
                completion(.success(movies))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
