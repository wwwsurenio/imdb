//
//  ViewController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import UIKit

class MovieViewController: UIViewController {
    let movieController: MovieControllerInput
    let movieThumb = UIView()
    let filmTitleLabel = UILabel()
    let stackView = UIStackView()
    let movieDescriptionLabel = UILabel()
    let ratingLabel = UILabel()
    let ratingContainerView = UIView()
    
    init(movieController: MovieControllerInput) {
        self.movieController = movieController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // movieThumb
        movieThumb.translatesAutoresizingMaskIntoConstraints = false
        movieThumb.backgroundColor = .white
        view.addSubview(movieThumb)
        
        NSLayoutConstraint.activate([
            movieThumb.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            movieThumb.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            movieThumb.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            movieThumb.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        // filmTitleLabel
        filmTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        filmTitleLabel.text = "Dune: Part Two (2023)"
        filmTitleLabel.textColor = .white
        filmTitleLabel.numberOfLines = 2
        view.addSubview(filmTitleLabel)
        
        NSLayoutConstraint.activate([
            filmTitleLabel.topAnchor.constraint(equalTo: movieThumb.bottomAnchor, constant: 16),
            filmTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            filmTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: filmTitleLabel.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
        
        // movieDescription
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel.text = "A boy becomes the Messiah of nomads on a desert planet that has giant worms that protect a commodity called Spice. Spice changes people into travelers, mystics and madmen. What price will he pay to become the new ruler of their universe?"
        movieDescriptionLabel.textColor = .white
        movieDescriptionLabel.numberOfLines = 5
        movieDescriptionLabel.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(movieDescriptionLabel)
        
        // Constraints for movieDescription
        NSLayoutConstraint.activate([
            movieDescriptionLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
        
        // ratingLabel
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "5.0"
        ratingLabel.textColor = .white
        ratingLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        stackView.addArrangedSubview(ratingContainerView)
        ratingContainerView.addSubview(ratingLabel)
        
        // Constraints for ratingLabel
        NSLayoutConstraint.activate([
            ratingContainerView.widthAnchor.constraint(equalTo: ratingLabel.widthAnchor),
            ratingLabel.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func blah() {
        // do something
    }
}
