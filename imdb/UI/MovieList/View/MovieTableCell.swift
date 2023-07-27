import UIKit

class MovieTableCell: UITableViewCell {
    
    var movieThumb: UIImage? {
        didSet {
            movieThumbImageView.image = movieThumb
        }
    }
    
    var movieTitle: String? {
        didSet {
            movieTitleLabel.text = movieTitle
        }
    }
    
    var movieDescription: String? {
        didSet {
            movieDescriptionLabel.text = movieDescription
        }
    }
    
    var movieRating: String? {
        didSet {
            ratingLabel.text = movieRating
        }
    }
    
    private let movieThumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieThumbImageView)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieDescriptionLabel)
        contentView.addSubview(ratingLabel)
        
        movieThumbImageView.anchor(top: contentView.topAnchor,
                                   left: contentView.leftAnchor,
                                   bottom: contentView.bottomAnchor,
                                   right: nil,
                                   paddingTop: 5,
                                   paddingLeft: 5,
                                   paddingBottom: 5,
                                   paddingRight: 0,
                                   width: 90,
                                   height: 0)
        
        movieTitleLabel.anchor(top: contentView.topAnchor,
                               left: movieThumbImageView.rightAnchor,
                               bottom: nil,
                               right: contentView.rightAnchor,
                               paddingTop: 10,
                               paddingLeft: 10,
                               paddingBottom: 0,
                               paddingRight: 10,
                               width: 0,
                               height: 0)
        
        movieDescriptionLabel.anchor(top: movieTitleLabel.bottomAnchor,
                                     left: movieThumbImageView.rightAnchor,
                                     bottom: contentView.bottomAnchor,
                                     right: ratingLabel.leftAnchor,
                                     paddingTop: 5,
                                     paddingLeft: 10,
                                     paddingBottom: 5,
                                     paddingRight: 5,
                                     width: 0,
                                     height: 0)
        
        ratingLabel.anchor(top: contentView.topAnchor,
                           left: nil,
                           bottom: contentView.bottomAnchor,
                           right: contentView.rightAnchor,
                           paddingTop: 10,
                           paddingLeft: 0,
                           paddingBottom: 0,
                           paddingRight: 10,
                           width: 80,
                           height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
