import Foundation
import UIKit

class MovieReleaseDateCell: UITableViewCell {
    var movieReleaseDate: String? {
        didSet {
            if let releaseDate = movieReleaseDate {
                movieReleaseDateLabel.text = releaseDate
            } else {
                movieReleaseDateLabel.text = nil
            }
        }
    }
    
    var movieLanguage: String? {
        didSet {
            if let language = movieLanguage {
                movieLanguageLabel.text = language
            } else {
                movieLanguageLabel.text = nil
            }
        }
    }
    
    private let movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let movieLanguageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let movieReleaseDateHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Release date"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    private let movieLanguageHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Language"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .left
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
        
        contentView.addSubview(movieReleaseDateHeaderLabel)
        contentView.addSubview(movieReleaseDateLabel)
        contentView.addSubview(movieLanguageHeaderLabel)
        contentView.addSubview(movieLanguageLabel)
        
        movieReleaseDateHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseDateHeaderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        movieReleaseDateHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        
        movieReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseDateLabel.topAnchor.constraint(equalTo: movieReleaseDateHeaderLabel.bottomAnchor, constant: 4).isActive = true
        movieReleaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        
        movieLanguageHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        movieLanguageHeaderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        movieLanguageHeaderLabel.leadingAnchor.constraint(equalTo: movieReleaseDateLabel.trailingAnchor, constant: 32).isActive = true
        
        movieLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        movieLanguageLabel.topAnchor.constraint(equalTo: movieLanguageHeaderLabel.bottomAnchor, constant: 4).isActive = true
        movieLanguageLabel.leadingAnchor.constraint(equalTo: movieLanguageHeaderLabel.leadingAnchor).isActive = true
        movieLanguageLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -32).isActive = true
        movieLanguageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
