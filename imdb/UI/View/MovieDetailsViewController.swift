//
//  MovieDetailsViewController.swift
//  imdb
//
//  Created by User01 on 29/5/23.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    let movieDetailsController: MovieDetailsController
	var movie: MovieDetailsModel?

	let nameLabel = UILabel()
    
    init(movieID: Int, movieDetailsController: MovieDetailsController) {
        self.movieDetailsController = movieDetailsController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        
        movieDetailsController.delegate = self
        movieDetailsController.get()
    }
    
    private func setupUI() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
		// Display the movie name
        
        view.addSubview(nameLabel)
        
        // Set constraints for the label
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension MovieDetailsViewController: MovieDetailsControllerDelegate {
    func receivedData(movieDetailsModel: MovieDetailsModel) {
        movie = movieDetailsModel

		nameLabel.text = movie?.movies.first?.movieTitle
    }
}
