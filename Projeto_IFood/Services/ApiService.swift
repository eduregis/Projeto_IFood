//
//  ApiService.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 02/04/22.
//

import Foundation

protocol ApiServiceProtocol {
    func getListMovies(completionHandler: @escaping (Result<[Movie], ApiServiceError>) -> Void)
}

class ApiService: ApiServiceProtocol {
    // Criando enums para facilitar consultas em outras listagens da api.
    private enum Endpoint: String {
        case films = "/films"
    }
    
    private let networkMonitor = NetworkMonitor.shared
    private let url = "https://ghibliapi.herokuapp.com"
        
    private func getUrl(_ endpoint: Endpoint) -> String {
        return url + endpoint.rawValue
    }
    
    func getListMovies(completionHandler: @escaping (Result<[Movie], ApiServiceError>) -> Void) {
        // Caso não tenha conexão com a internet
        guard networkMonitor.isReachable else {
            if let response = ListMoviesCache.get() {
                // Caso tenha a lista salva na persistência local.
                return completionHandler(.success(response))
            } else {
                // Caso não tenha a persistência local, retorna uma falha.
                return completionHandler(.failure(.noInternetConnection))
            }
        }
        let urlString = getUrl(.films)
        guard let url = URL(string: urlString) else { return completionHandler(.failure(ApiServiceError.invalidUrl)) }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return completionHandler(.failure(ApiServiceError.responseError)) }
            do {
                // Retorna a lista de filmes.
                let response = try JSONDecoder().decode([Movie].self, from: data)
                // Salva a lista na persistência local, caso falte internet.
                ListMoviesCache.save(response)
                completionHandler(.success(response))
            } catch {
                // Rettorna erro caso os dados não estejam de acordo.
                completionHandler(.failure(ApiServiceError.decodingError))
            }
        }
        task.resume()
    }
}
