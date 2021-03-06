//
//  ListViewModel.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 02/04/22.
//

import UIKit

// Nesse protocolo Type vão as chamadas dos métodos da viewModel a serem utilizados pela viewController.
protocol ListMovieViewModelType {
    var output: ListMovieViewModelOutput? { get set }
    var listMovies: [Movie]? { get set }
    
    func fetchMovies(searchText: String)
    func numberOfRows() -> Int
    func generateCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

// Nesse protocolo Output vão as chamadas dos métodos da viewController a serem chamados pela viewModel.
protocol ListMovieViewModelOutput: AnyObject {
    func reloadDisplayData()
    func alertErrorTrigger()
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
        // Tratamos aqui os resultados do me1todo que chama a API, seja esse resultado uma lista de filmes, ou um erro.
        self.getListMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let listMovies):
                // Caso tenhamos sucesso, ordenamos e até filtramos a lista se tiver algum texto na searchController.
                self.listMovies = listMovies.sorted(by: { $0.title < $1.title })
                self.listMovies = listMovies
                if searchText != "" {
                    self.listMovies = self.listMovies?.filter { movie in
                        return (movie.title.uppercased().contains(searchText.uppercased()))
                    }
                }
                // Usamos o output aqui para chamarmos a função reload presente na controller.
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.output?.reloadDisplayData()
                }
            case .failure:
                self.output?.alertErrorTrigger()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.listMovies?.count ?? 0
    }
    
    func generateCell(for tableView: UITableView,
                      indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.IDENTIFIER) as? MovieCell else {
            return UITableViewCell()
        }
        let viewModel = MovieCellViewModel()
        let url = URL(string: listMovies![indexPath.row].image)
        guard let data = try? Data(contentsOf: url!) else {
            return UITableViewCell()
        }
        viewModel.create(model: MovieCellModel(title: "\(self.listMovies![indexPath.row].title)",
                                               director: "\(self.listMovies![indexPath.row].director)",
                                               image: UIImage(data: data)))
        cell.setupValues(with: viewModel)
        return cell
    }
    
    func getListMovies(completion: @escaping (Result<[Movie], ApiServiceError>) -> Void) {
        // Usamos a instância da classe manipuladora de API pra recuperar uma lista de filmes.
        repository.getListMovies { response in
            switch response {
            case .success(let listMovies):
                var movies: [Movie] = []
                for movie in listMovies {
                    movies.append(movie)
                }
                completion(.success(movies))
            // Caso não consigamos, retornamos um erro.
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
