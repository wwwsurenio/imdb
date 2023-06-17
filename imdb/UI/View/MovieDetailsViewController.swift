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
        
        // Create and configure the table view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieDetailsTableCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.separatorStyle = .none
        
        // Load movie details
        movieDetailsController.delegate = self
        movieDetailsController.get()
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
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        // Configure the cell with movie details based on the row index
        switch indexPath.row {
        case 0:
            if let moviePosterURL = movie?.moviePosterURL {
                if let cachedImage = imageCache[moviePosterURL] {
                    cell.imageView?.image = cachedImage
                } else {
                    cell.imageView?.image = UIImage(named: "placeholderImage") // Placeholder image while loading
                    DispatchQueue.global().async { [weak self] in
                        if let imageData = try? Data(contentsOf: moviePosterURL) {
                            let moviePoster = UIImage(data: imageData)
                            self?.imageCache[moviePosterURL] = moviePoster
                            DispatchQueue.main.async {
                                cell.imageView?.image = moviePoster
                                cell.setNeedsLayout()
                            }
                        }
                    }
                }
            }
        case 1:
            cell.textLabel?.text = movie?.movieTitle
        case 2:
            if let vote = movie?.movieVote, let voteCount = movie?.movieVoteCount {
                cell.textLabel?.text = "\(vote) (\(voteCount) votes)"
            } else {
                cell.textLabel?.text = nil
            }
        case 3:
            cell.textLabel?.text = movie?.movieReleaseDate
        case 4:
            cell.textLabel?.numberOfLines = 0 // Allow multiple lines for movie overview
            cell.textLabel?.text = movie?.movieOverview
            cell.textLabel?.lineBreakMode = .byWordWrapping
        default:
            break
        }
        
        return cell
    }


}
