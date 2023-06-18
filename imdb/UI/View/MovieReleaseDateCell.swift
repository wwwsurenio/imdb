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
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let movieLanguageLabel: UILabel = {
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
        
        labelsStackView.addArrangedSubview(movieReleaseDateLabel)
        labelsStackView.addArrangedSubview(movieLanguageLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
