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
    private let movieIDLabel: UILabel = UILabel()
    
    init(movie: MovieModel) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.text = "MovieDetails Screen"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        movieIDLabel.text = "Movie ID: \(movie.movieID)"
        movieIDLabel.textAlignment = .center
        movieIDLabel.font = UIFont.systemFont(ofSize: 18)
        movieIDLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieIDLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            movieIDLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieIDLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
    }
    
}
