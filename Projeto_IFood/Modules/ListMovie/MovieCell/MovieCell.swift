//
//  MovieCell.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static let IDENTIFIER: String = "MovieCell"

    var indexPath: IndexPath?
    var disableGestureRecognizer = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Componentes da tela
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = title.font.withSize(20)
        self.addSubview(title)
        return title
    }()
    
    lazy var directorLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .systemGray2
        title.font = title.font.withSize(14)
        self.addSubview(title)
        return title
    }()
    
    lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .systemGray
        self.addSubview(image)
        return image
    }()
    
    // MARK: - Manipulando a UI

    func configureConstraints() {
        NSLayoutConstraint.activate([
            posterImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            posterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
            posterImage.widthAnchor.constraint(equalToConstant: 30.0),
            posterImage.heightAnchor.constraint(equalTo: posterImage.widthAnchor, multiplier: 1.5),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 15.0),
            titleLabel.topAnchor.constraint(equalTo: posterImage.topAnchor, constant: 5.0),
            
            directorLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 15.0),
            directorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = String()
        directorLabel.text = String()
        posterImage.image = UIImage()
    }
    
    func setupValues(with viewModel: MovieCellViewModel) {
        titleLabel.text = viewModel.model.title
        directorLabel.text = viewModel.model.director
        posterImage.image = viewModel.model.image
    }
}
