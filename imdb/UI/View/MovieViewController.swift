//
//  ViewController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import UIKit

class MovieViewController: UIViewController {
    var movies: [MovieModel] = [MovieModel]()
    let movieController: MovieControllerInput
    
    init(movieController: MovieControllerInput) {
        self.movieController = movieController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMovieArray()
        
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        //        setupUI()
    }
    
    func blah() {
        // do something
    }
}

//MARK: - TableViewDelegate

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Здесь настройка ячейки
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let currentLastItem = movies[indexPath.row]
        cell.textLabel?.text = currentLastItem.movieTitle
        return cell
    }
    
    func createMovieArray() {
        movies.append(MovieModel(
            moviePoster: #imageLiteral(resourceName:"TheShawshankRedemption"),
            movieTitle: "The Shawshank Redemption",
            movieDescription: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            movieRating: 9.3))
        movies.append(MovieModel(
            moviePoster: #imageLiteral(resourceName:"TheGodfather"),
            movieTitle: "The Godfather",
            movieDescription: "An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.",
            movieRating: 9.2))
        movies.append(MovieModel(
            moviePoster: #imageLiteral(resourceName:"TheDarkKnight"),
            movieTitle: "The Dark Knight",
            movieDescription: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
            movieRating: 9.0))
    }
}
