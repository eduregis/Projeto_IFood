//
//  MovieDetailViewController.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import UIKit
import Foundation

class MovieDetailViewController: UIViewController {
    
    var viewModel: MovieDetailViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        configureConstraints()
        if let movie = viewModel.movie {
            setupUI(movie: movie)
        }
    }
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        title.textColor = .white
        title.numberOfLines = 0
        self.view.addSubview(title)
        return title
    }()
    
    lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .systemGray2
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        self.view.addSubview(image)
        return image
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        return scrollView
    }()
    
    lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .systemGray2
        self.scrollView.addSubview(image)
        return image
    }()
    
    lazy var directorLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = title.font.withSize(14)
        self.scrollView.addSubview(title)
        return title
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = title.font.withSize(14)
        self.scrollView.addSubview(title)
        return title
    }()
    
    lazy var originalTitleRomanized: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = title.font.withSize(14)
        self.scrollView.addSubview(title)
        return title
    }()
    
    lazy var descriptionLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = title.font.withSize(14)
        title.numberOfLines = 0
        self.scrollView.addSubview(title)
        return title
    }()
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: view.topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerImage.heightAnchor.constraint(equalTo: bannerImage.widthAnchor, multiplier: 0.5),
            
            titleLabel.bottomAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: bannerImage.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: -10),
            
            scrollView.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            posterImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            posterImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            posterImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5),
            posterImage.heightAnchor.constraint(equalTo: posterImage.widthAnchor, multiplier: 1.5),
            
            directorLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 10),
            directorLabel.leadingAnchor.constraint(equalTo: bannerImage.leadingAnchor, constant: 20),
            directorLabel.trailingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: -20),
            
            releaseDateLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 5),
            releaseDateLabel.leadingAnchor.constraint(equalTo: directorLabel.leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: directorLabel.trailingAnchor),
            
            originalTitleRomanized.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 5),
            originalTitleRomanized.leadingAnchor.constraint(equalTo: releaseDateLabel.leadingAnchor),
            originalTitleRomanized.trailingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: originalTitleRomanized.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: originalTitleRomanized.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: originalTitleRomanized.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15)
        ])
        
        bannerImage.addOverlay(alpha: 0.5)
    }
    
    func setupUI(movie: Movie) {
        titleLabel.text = movie.title
        directorLabel.attributedText = viewModel.movieDetails(str1: "Director: ", str2: movie.director)
        bannerImage.image = viewModel.imageByURL(urlString: movie.movie_banner)
        posterImage.image = viewModel.imageByURL(urlString: movie.image)
        releaseDateLabel.attributedText = viewModel.movieDetails(str1: "Release Date: ", str2: movie.release_date)
        originalTitleRomanized.attributedText = viewModel.movieDetails(str1: "Original Title: ", str2: movie.original_title_romanised)
        descriptionLabel.attributedText = viewModel.movieDetails(str1: "Description: ", str2: movie.description)
    }
}

extension MovieDetailViewController: MovieDetailViewModelOutput {
    
    
    
}
