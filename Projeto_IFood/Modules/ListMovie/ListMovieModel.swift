//
//  ListMovieModel.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 02/04/22.
//

import Foundation

struct Movie: Codable {
    let id: String
    let title: String
    let description: String
    let director: String
    let release_date: String
    let image: String
    let movie_banner: String
    let original_title: String
    let original_title_romanised: String
}

// Essa struct usa UserDefaults pra guardar os dados e fazer o app funcionar mesmo sem internet se já tiver sido aberto uma vez com internet.
// OBS: - Sei que não é uma boa ideia colocar muita coisa no UserDefaults, estou utilizando isso aqui pra mostrar um uso prático, e também porque a API é pequena.
struct ListMoviesCache {
    
    static let key = "listMoviesCache"

    static func save(_ value: [Movie]!) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }

    static func get() -> [Movie]! {
        var userData: [Movie]!
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try? PropertyListDecoder().decode([Movie].self, from: data)
            return userData!
        } else {
            return userData
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
