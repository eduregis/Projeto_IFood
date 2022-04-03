//
//  MovieDetailViewModel.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import Foundation
import UIKit

// Nesse protocolo Type vão as chamadas dos métodos da viewModel a serem utilizados pela viewController.
protocol MovieDetailViewModelType {
    var output: MovieDetailViewModelOutput? { get set }
    var movie: Movie? { get set }
    func imageByURL(urlString: String) -> UIImage?
    func movieDetails(str1: String, str2: String) -> NSMutableAttributedString
}

// Nesse protocolo Output vão as chamadas dos métodos da viewController a serem chamados pela viewModel.
protocol MovieDetailViewModelOutput: AnyObject {

}

final class MovieDetailViewModel {
    let repository: ApiServiceProtocol
    
    public weak var output: MovieDetailViewModelOutput?
    var movie: Movie?
    
    init(repository: ApiServiceProtocol = ApiService()) {
        self.repository = repository
    }
    
    func imageByURL(urlString: String) -> UIImage? {
        guard let url = URL(string: urlString) else { return UIImage() }
        guard let data = try? Data(contentsOf: url) else { return UIImage() }
        return UIImage(data: data)
    }
    
    func movieDetails(str1: String, str2: String) -> NSMutableAttributedString {
        let dateText = NSMutableAttributedString.init(string: "\(str1)\(str2)")
            dateText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)],
                                   range: NSMakeRange(0, str1.count))
            dateText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)],
                                   range: NSMakeRange(str1.count,str2.count))
        return dateText
    }
}

extension MovieDetailViewModel: MovieDetailViewModelType {
    
}
