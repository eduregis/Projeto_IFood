//
//  MovieCell.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import UIKit

protocol MovieCellDelegate: AnyObject {
    func movieCellSelected(index: IndexPath?)
}

class MovieCell: UITableViewCell {
    
    weak var delegate: MovieCellDelegate?
    
    static let IDENTIFIER: String = "MovieCell"

    var indexPath: IndexPath?
    var disableGestureRecognizer = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureConstraints()
        
        let cellTapped = UITapGestureRecognizer(target: self, action: #selector(self.cellTapped))
        self.addGestureRecognizer(cellTapped)
    }
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font.withSize(20)
        title.text = "aaaa"
        self.addSubview(title)
        return title
    }()
    
    lazy var directorLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font.withSize(20)
        title.text = "aaaa"
        self.addSubview(title)
        return title
    }()
//
//    lazy var posterImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(image)
//        return image
//    }()
//
    func configureConstraints() {
        NSLayoutConstraint.activate([
//            posterImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            posterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
//            posterImage.widthAnchor.constraint(equalToConstant: 30.0),
//            posterImage.heightAnchor.constraint(equalTo: posterImage.widthAnchor, multiplier: 1.5),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            directorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            directorLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
            directorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = String()
        directorLabel.text = String()
//        posterImage.image = UIImage()
    }
    
    func setupValues(with viewModel: MovieCellViewModel) {
        titleLabel.text = viewModel.model.title
        directorLabel.text = viewModel.model.director
    }
    
    @objc
    func cellTapped(sender: UITapGestureRecognizer) {
        delegate?.movieCellSelected(index: indexPath)
    }
}
