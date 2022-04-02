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
}

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
