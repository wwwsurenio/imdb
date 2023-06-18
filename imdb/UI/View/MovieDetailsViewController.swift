//
//  MovieDetailsViewController.swift
//  imdb
//
//  Created by User01 on 29/5/23.
//

import Foundation
import UIKit

enum MovieDetailsCellType: CaseIterable {
    case moviePoster
    case movieTitle
    case movieVote
    case movieReleaseDate
    case movieOverview
}

class MovieDetailsViewController: UIViewController {
    let movieDetailsController: MovieDetailsControllerInput
    var movie: MovieDetailsModel?
    
    let nameLabel = UILabel()
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    let cellTypes: [MovieDetailsCellType] = [.moviePoster, .movieTitle, .movieVote]
    
    init(movieDetailsController: MovieDetailsControllerInput) {
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
        tableView.separatorStyle = .none
        tableView.register(MoviePosterCell.self, forCellReuseIdentifier: "MoviePosterCell")
        tableView.register(MovieTitleCell.self, forCellReuseIdentifier: "MovieTitleCell")
        tableView.register(MovieRatingsCell.self, forCellReuseIdentifier: "MovieRatingsCell")
        
        // Load movie details
        movieDetailsController.delegate = self
        movieDetailsController.get()
    }
}

extension MovieDetailsViewController: MovieDetailsControllerDelegate {
    func receivedData(movieDetailsModel: MovieDetailsModel) {
        movie = movieDetailsModel
        tableView.reloadData()
    }
}

//MARK: - TableViewDelegate
extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.row]
        guard let movie = movie else { return UITableViewCell() }
        
        switch cellType {
            
        case .moviePoster:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoviePosterCell", for: indexPath) as! MoviePosterCell
            let moviePosterURL = API.imageURL.appending(path: movie.moviePosterURL.absoluteString)
            Task {
                cell.movieThumb = await moviePosterURL.getImage()
            }
            return cell
            
        case .movieTitle:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTitleCell", for: indexPath) as! MovieTitleCell
            cell.movieTitle = movie.movieTitle
            return cell
        
        case .movieVote:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieRatingsCell", for: indexPath) as! MovieRatingsCell
            cell.movieVote = movie.movieVote
            cell.movieVoteCount = movie.movieVoteCount
            cell.moviePopularity = movie.moviePopularity
            return cell
        case .movieReleaseDate:
            break
        case .movieOverview:
            break
        }
        fatalError()
        
        //        case 1:
        //            cell.textLabel?.text = movie?.movieTitle
        //            cell.textLabel?.numberOfLines = 0
        //            cell.textLabel?.lineBreakMode = .byWordWrapping
        //            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //
        //        case 2:
        //            if let vote = movie?.movieVote, let voteCount = movie?.movieVoteCount {
        //                cell.textLabel?.text = "\(vote) (\(voteCount) votes)"
        //            } else {
        //                cell.textLabel?.text = nil
        //            }
        //        case 3:
        //            cell.textLabel?.text = movie?.movieReleaseDate
        //        case 4:
        //            cell.textLabel?.numberOfLines = 0
        //            cell.textLabel?.text = movie?.movieOverview
        //            cell.textLabel?.lineBreakMode = .byWordWrapping
        //        default:
        //            break
        //        }
        //
        //        return cell
    }
}
