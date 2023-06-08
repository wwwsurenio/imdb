//
//  MovieDetailsTableCell.swift
//  imdb
//
//  Created by User01 on 8/6/23.
//

import Foundation
import UIKit

class MovieDetailsTableCell: UITableViewCell {
    
    var moviePoster: UIImage? {
        didSet {
            moviePosterImageView.image = moviePoster
        }
    }
    
    var movieTitle: String? {
        didSet {
            movieTitleLabel.text = movieTitle
        }
    }
    
    var movieVote: String? {
        didSet {
            movieVoteLabel.text = movieVote
        }
    }
    
    var movieVoteCount: String? {
        didSet {
            movieVoteCountLabel.text = movieVoteCount
        }
    }
    
    var movieReleaseDate: String? {
        didSet {
            movieReleaseDateLabel.text = movieReleaseDate
        }
    }
    
    var movieOverview: String? {
        didSet {
            movieOverviewLabel.text = movieOverview
        }
    }
    
    private let moviePosterImageView: UIImageView = {
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
    
    private let movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let movieOverviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieVoteLabel)
        contentView.addSubview(movieVoteCountLabel)
        contentView.addSubview(movieReleaseDateLabel)
        contentView.addSubview(movieOverviewLabel)
        
        moviePosterImageView.anchor(top: contentView.topAnchor,
                                    left: contentView.leftAnchor,
                                    bottom: nil,
                                    right: contentView.rightAnchor,
                                    paddingTop: 5,
                                    paddingLeft: 5,
                                    paddingBottom: 0,
                                    paddingRight: 5,
                                    width: 0,
                                    height: contentView.bounds.height * 0.75)
        
        movieTitleLabel.anchor(top: moviePosterImageView.bottomAnchor,
                               left: contentView.leftAnchor,
                               bottom: nil,
                               right: contentView.rightAnchor,
                               paddingTop: 10,
                               paddingLeft: 10,
                               paddingBottom: 0,
                               paddingRight: 10,
                               width: 0,
                               height: 0)
        
        movieVoteLabel.anchor(top: movieTitleLabel.bottomAnchor,
                              left: contentView.leftAnchor,
                              bottom: nil,
                              right: contentView.centerXAnchor,
                              paddingTop: 10,
                              paddingLeft: 10,
                              paddingBottom: 0,
                              paddingRight: 0,
                              width: 0,
                              height: 0)
        
        movieVoteCountLabel.anchor(top: movieVoteLabel.topAnchor,
                                   left: contentView.centerXAnchor,
                                   bottom: nil,
                                   right: contentView.rightAnchor,
                                   paddingTop: 0,
                                   paddingLeft: 0,
                                   paddingBottom: 0,
                                   paddingRight: 10,
                                   width: 0,
                                   height: 0)
        
        movieReleaseDateLabel.anchor(top: movieVoteLabel.bottomAnchor,
                                     left: contentView.leftAnchor,
                                     bottom: nil,
                                     right: contentView.centerXAnchor,
                                     paddingTop: 10,
                                     paddingLeft: 10,
                                     paddingBottom: 0,
                                     paddingRight: 0,
                                     width: 0,
                                     height: 0)
        
        movieOverviewLabel.anchor(top: movieReleaseDateLabel.bottomAnchor,
                                  left: contentView.leftAnchor,
                                  bottom: contentView.bottomAnchor,
                                  right: contentView.rightAnchor,
                                  paddingTop: 10,
                                  paddingLeft: 10,
                                  paddingBottom: 10,
                                  paddingRight: 10,
                                  width: 0,
                                  height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
