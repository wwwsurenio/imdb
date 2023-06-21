import Foundation
import UIKit

class MovieRatingsCell: UITableViewCell {
    
    var movieVote: Double? {
        didSet {
            if let vote = movieVote {
                movieVoteLabel.text = String(format: "%.1f", vote)
            } else {
                movieVoteLabel.text = nil
            }
        }
    }
    
    var movieVoteCount: Int? {
        didSet {
            if let voteCount = movieVoteCount {
                movieVoteCountLabel.text = "\(voteCount)"
            } else {
                movieVoteCountLabel.text = nil
            }
        }
    }
    
    var moviePopularity: Double? {
        didSet {
            if let popularity = moviePopularity {
                moviePopularityLabel.text = "\(popularity)"
            } else {
                moviePopularityLabel.text = nil
            }
        }
    }
    
    private let movieVoteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    private let movieVoteCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    private let moviePopularityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let movieVoteBox = createBox()
        movieVoteBox.addSubview(movieVoteLabel)
        let movieVoteRatingLabel = createSubLabel(withText: "Rating")
        movieVoteBox.addSubview(movieVoteRatingLabel)
        
        let movieVoteCountBox = createBox()
        movieVoteCountBox.addSubview(movieVoteCountLabel)
        let movieVoteCountVoteLabel = createSubLabel(withText: "Vote count")
        movieVoteCountBox.addSubview(movieVoteCountVoteLabel)
        
        let moviePopularityBox = createBox()
        moviePopularityBox.addSubview(moviePopularityLabel)
        let moviePopularityCountLabel = createSubLabel(withText: "Popularity")
        moviePopularityBox.addSubview(moviePopularityCountLabel)
        
        labelsStackView.addArrangedSubview(movieVoteBox)
        labelsStackView.addArrangedSubview(movieVoteCountBox)
        labelsStackView.addArrangedSubview(moviePopularityBox)
        
        contentView.addSubview(labelsStackView)
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        labelsStackView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        movieVoteLabel.translatesAutoresizingMaskIntoConstraints = false
        movieVoteLabel.centerXAnchor.constraint(equalTo: movieVoteBox.centerXAnchor).isActive = true
        movieVoteLabel.centerYAnchor.constraint(equalTo: movieVoteBox.centerYAnchor, constant: -10).isActive = true
        
        movieVoteRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        movieVoteRatingLabel.topAnchor.constraint(equalTo: movieVoteLabel.bottomAnchor, constant: 5).isActive = true
        movieVoteRatingLabel.centerXAnchor.constraint(equalTo: movieVoteBox.centerXAnchor).isActive = true
        
        movieVoteCountLabel.translatesAutoresizingMaskIntoConstraints = false
        movieVoteCountLabel.centerXAnchor.constraint(equalTo: movieVoteCountBox.centerXAnchor).isActive = true
        movieVoteCountLabel.centerYAnchor.constraint(equalTo: movieVoteCountBox.centerYAnchor, constant: -10).isActive = true
        
        movieVoteCountVoteLabel.translatesAutoresizingMaskIntoConstraints = false
        movieVoteCountVoteLabel.topAnchor.constraint(equalTo: movieVoteCountLabel.bottomAnchor, constant: 5).isActive = true
        movieVoteCountVoteLabel.centerXAnchor.constraint(equalTo: movieVoteCountBox.centerXAnchor).isActive = true
        
        moviePopularityLabel.translatesAutoresizingMaskIntoConstraints = false
        moviePopularityLabel.centerXAnchor.constraint(equalTo: moviePopularityBox.centerXAnchor).isActive = true
        moviePopularityLabel.centerYAnchor.constraint(equalTo: moviePopularityBox.centerYAnchor, constant: -10).isActive = true
        
        moviePopularityCountLabel.translatesAutoresizingMaskIntoConstraints = false
        moviePopularityCountLabel.topAnchor.constraint(equalTo: moviePopularityLabel.bottomAnchor, constant: 5).isActive = true
        moviePopularityCountLabel.centerXAnchor.constraint(equalTo: moviePopularityBox.centerXAnchor).isActive = true
    }
    
    private func createBox() -> UIView {
        let box = UIView()
        box.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        box.layer.cornerRadius = 24
        box.clipsToBounds = true
        box.translatesAutoresizingMaskIntoConstraints = false
        box.heightAnchor.constraint(equalToConstant: 88).isActive = true
        return box
    }
    
    private func createSubLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
