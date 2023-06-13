//
//  MovieDetailsViewController.swift
//  imdb
//
//  Created by User01 on 29/5/23.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    private var movie: MovieDetailsModel
    private let titleLabel: UILabel = UILabel()
    private let overviewLabel: UILabel = UILabel()
    private let movieDetailsController: MovieDetailsControllerInput
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
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
        
        
        movieDetailsController.delegate = self
        movieDetailsController.get()
    }
}

extension MovieDetailsViewController: MovieDetailsControllerDelegate {
    
//    func receivedData(movieDetailsModel: MovieDetailsModel) {
//
//
//    }
//
//    func receivedData(movieDetailsModels: [MovieDetailsModel]) {
//        guard let movieDetailsModel = movieDetailsModels.first else {
//            return
//        }
//
//        DispatchQueue.main.async { [weak self] in
//            self?.overviewLabel.text = "Movie Overview: \(movieDetailsModel.movieOverview)"
//        }
//    }
    
    func recievedData(movieDetailsModel: MovieDetailsModel) {
        movie = movieDetailsModel
        tableView.reloadData()
    }
    
}
