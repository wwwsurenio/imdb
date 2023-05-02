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
    
    init(movieController: MovieControllerInput) {
        self.movieController = movieController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.backgroundColor = .white
        view.addSubview(childView)
        
        childView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        childView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        childView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        childView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
    }
    
    func blah() {
        
    }
}

