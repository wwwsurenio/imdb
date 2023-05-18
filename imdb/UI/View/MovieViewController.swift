//
//  ViewController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import UIKit

class MovieViewController: UIViewController {
    let movies: [MovieModel] = [
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"TheShawshankRedemption"),
                movieTitle: "The Shawshank Redemption",
                movieDescription: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                movieRating: 9.3)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"TheGodfather"),
                movieTitle: "The Godfather",
                movieDescription: "An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.",
                movieRating: 9.2)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"TheDarkKnight"),
                movieTitle: "The Dark Knight",
                movieDescription: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
                movieRating: 9.0)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"TheGodfatherPartII"),
                movieTitle: "The Godfather: Part II",
                movieDescription: "The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on the family crime syndicate.",
                movieRating: 9.0)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"TheLordoftheRingsTheReturnoftheKing"),
                movieTitle: "The Lord of the Rings: The Return of the King",
                movieDescription: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
                movieRating: 8.9)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"PulpFiction"),
                movieTitle: "Pulp Fiction",
                movieDescription: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
                movieRating: 8.9)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"TheGoodtheBadandtheUgly"),
                movieTitle: "The Good, the Bad and the Ugly",
                movieDescription: "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.",
                movieRating: 8.8)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"FightClub"),
                movieTitle: "Fight Club",
                movieDescription: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.",
                movieRating: 8.8)),
            (MovieModel(
                moviePoster: #imageLiteral(resourceName:"ForrestGump"),
                movieTitle: "Forrest Gump",
                movieDescription: "The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.",
                movieRating: 8.8)),
            (MovieModel(
                    moviePoster: #imageLiteral(resourceName:"Inception"),
                    movieTitle: "Inception",
                    movieDescription: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
                    movieRating: 8.8))
    ]
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
        movieController.get()
        
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableCell.self, forCellReuseIdentifier: "cellId")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MovieTableCell
        let movie = movies[indexPath.row]
        cell.movieThumb = movie.moviePoster
        cell.movieTitle = movie.movieTitle
        cell.movieDescription = movie.movieDescription
        cell.movieRating = "\(movie.movieRating)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: - UIView extension

import UIKit

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
