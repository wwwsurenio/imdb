//
//  ViewController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import UIKit

class MovieViewController: UIViewController {
    var movies: [MovieModel] = []
    let movieController: MovieControllerInput
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    
    var imageCache = [URL: UIImage]()
    
    init(movieController: MovieControllerInput) {
        self.movieController = movieController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieController.get()
        movieController.delegate = self
//        self.title = "Movies"
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableCell.self, forCellReuseIdentifier: "cellId")
    }
    
}

//MARK: - TableViewDelegate

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MovieTableCell
        let movie = movies[indexPath.row]
        cell.movieThumb = UIImage()
        DispatchQueue.global().async { [weak self] in
            if let moviePoster = self?.imageCache[movie.moviePosterURL] {
                DispatchQueue.main.async {
                    cell.movieThumb = moviePoster
                }
            } else {
                guard let imageData = try? Data(contentsOf: movie.moviePosterURL) else {
                    return
                }
                let moviePoster = UIImage(data: imageData)
                DispatchQueue.main.async { [weak self] in
                    self?.imageCache[movie.moviePosterURL] = moviePoster
                    cell.movieThumb = moviePoster
                }
            }
        }
        //movie.moviePoster
        cell.movieTitle = movie.movieTitle
        cell.movieDescription = movie.movieDescription
        cell.movieRating = "\(movie.movieRating)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let selectedMovieID = movie.movieID
        
        let movieDetailsController = MovieDetailsController(movieID: selectedMovieID)
        let movieDetailsVC = MovieDetailsViewController(movieDetailsController: movieDetailsController)
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
}

//MARK: - recievedData

extension MovieViewController: MovieControllerDelegate {
    func recievedData(movieModels: [MovieModel]) {
        movies = movieModels
        tableView.reloadData()
    }
}

//MARK: - UIView extension

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat = 0,
                height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}
