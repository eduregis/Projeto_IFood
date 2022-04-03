//
//  MovieCellViewModel.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import UIKit
import Combine

class MovieCellViewModel: ObservableObject {
    @Published var model = MovieCellModel()
    
    func create(model: MovieCellModel) {
        self.model = model
    }
    
    func removeGestureRecognizer(view: UIView) {
        for recognizer in view.gestureRecognizers ?? [] {
            view.removeGestureRecognizer(recognizer)
        }
    }
}
