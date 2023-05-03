//
//  ViewController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import UIKit

class MovieViewController: UIViewController {
    let movieController: MovieControllerInput
    let childView = UIView()
    let label01 = UILabel()
    let stackView = UIStackView()
    let label02 = UILabel()
    let rating = UILabel()
    
    init(movieController: MovieControllerInput) {
        self.movieController = movieController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Child View
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.backgroundColor = .white
        view.addSubview(childView)
        
        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            childView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            childView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            childView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        // Label01
        label01.translatesAutoresizingMaskIntoConstraints = false
        label01.text = "New Label 01"
        label01.textColor = .white
        view.addSubview(label01)
        
        NSLayoutConstraint.activate([
            label01.topAnchor.constraint(equalTo: childView.bottomAnchor, constant: 16),
            label01.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            label01.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: label01.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        // Label02
        label02.translatesAutoresizingMaskIntoConstraints = false
        label02.text = "New Label 02"
        label02.textColor = .white
        stackView.addArrangedSubview(label02)
        
        // Rating
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.text = "5.0"
        rating.textColor = .white
        stackView.addArrangedSubview(rating)
    }
    
    func blah() {
        // do something
    }
}
