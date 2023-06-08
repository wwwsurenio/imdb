//
//  MovieDetailsViewController.swift
//  imdb
//
//  Created by User01 on 29/5/23.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    private let movie: MovieModel
    private let titleLabel: UILabel = UILabel()
    private let overviewLabel: UILabel = UILabel()
    
    private let movieDetailsController: MovieDetailsControllerInput
    
    init(movie: MovieModel, movieDetailsController: MovieDetailsControllerInput) {
        self.movie = movie
        self.movieDetailsController = movieDetailsController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.text = "Movie Title: \(movie.movieTitle)"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        overviewLabel.text = "Movie Overview: Loading..."
        overviewLabel.textAlignment = .center
        overviewLabel.font = UIFont.systemFont(ofSize: 18)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            overviewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
        
        movieDetailsController.delegate = self
        movieDetailsController.get()
    }
}

extension MovieDetailsViewController: MovieDetailsControllerDelegate {
    func receivedData(movieDetailsModel: MovieDetailsModel) {
    }
    
    func receivedData(movieDetailsModels: [MovieDetailsModel]) {
        guard let movieDetailsModel = movieDetailsModels.first else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.overviewLabel.text = "Movie Overview: \(movieDetailsModel.movieOverview)"
        }
    }
}
