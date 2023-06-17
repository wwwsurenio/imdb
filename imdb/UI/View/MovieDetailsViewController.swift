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
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    var imageCache = [URL: UIImage]()
    
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MovieDetailsTableCell.self, forCellReuseIdentifier: "MovieCell")

        
        movieDetailsController.delegate = self
        movieDetailsController.get()
    }
    
    private func setupUI() {
        // Add the table view to the view hierarchy and set its constraints
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension MovieDetailsViewController: MovieDetailsControllerDelegate {
    func receivedData(movieDetailsModel: MovieDetailsModel) {
        movie = movieDetailsModel

        tableView.register(MovieDetailsTableCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}


//MARK: - TableViewDelegate
extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieDetailsTableCell
        
        // Configure the cell with movie details based on the row index
        switch indexPath.row {
        case 0:
                if let moviePosterURL = movie?.moviePosterURL {
                    if let cachedImage = imageCache[moviePosterURL] {
                        cell.moviePoster = cachedImage
                    } else {
                        cell.moviePoster = UIImage(named: "placeholderImage") // Placeholder image while loading
                        DispatchQueue.global().async { [weak self] in
                            if let imageData = try? Data(contentsOf: moviePosterURL) {
                                let moviePoster = UIImage(data: imageData)
                                self?.imageCache[moviePosterURL] = moviePoster
                                DispatchQueue.main.async {
                                    cell.moviePoster = moviePoster
                                }
                            }
                        }
                    }
                } else {
                    cell.moviePoster = nil
                }
        case 1:
            cell.movieTitle = movie?.movieTitle
        case 2:
            cell.movieVote = movie?.movieVote
            cell.movieVoteCount = movie?.movieVoteCount
        case 3:
            cell.movieReleaseDate = movie?.movieReleaseDate
        case 4:
            cell.movieOverview = movie?.movieOverview
        default:
            break
        }
        
        return cell
    }

}
