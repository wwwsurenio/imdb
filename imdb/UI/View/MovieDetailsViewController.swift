//
//  MovieDetailsViewController.swift
//  imdb
//
//  Created by User01 on 29/5/23.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    let movieID: Int
    let movieDetailsController: MovieDetailsController
    
    init(movieID: Int, movieDetailsController: MovieDetailsController) {
        self.movieID = movieID
        self.movieDetailsController = movieDetailsController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        movieDetailsController.delegate = self
        movieDetailsController.get()
    }
}

extension MovieDetailsViewController: MovieDetailsControllerDelegate {
    func receivedData(movieDetailsModel: MovieDetailsModel) {
        
    }
}
