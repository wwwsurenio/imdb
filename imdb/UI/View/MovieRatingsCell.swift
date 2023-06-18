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
                movieVoteCountLabel.text = "\(voteCount) votes"
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
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let movieVoteCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let moviePopularityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelsStackView)
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        labelsStackView.addArrangedSubview(movieVoteLabel)
        labelsStackView.addArrangedSubview(movieVoteCountLabel)
        labelsStackView.addArrangedSubview(moviePopularityLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
