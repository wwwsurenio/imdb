//
//  MovieTitleCell.swift
//  imdb
//
//  Created by User01 on 18/6/23.
//

import Foundation
import UIKit

class MovieTitleCell: UITableViewCell {
    
    var movieTitle: String? {
        didSet {
            movieTitleLabel.text = movieTitle
        }
    }
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieTitleLabel)
        
        movieTitleLabel.anchor(top: contentView.topAnchor,
                               left: contentView.leftAnchor,
                               bottom: contentView.bottomAnchor,
                               right: contentView.rightAnchor,
                               paddingTop: 8,
                               paddingLeft: 8,
                               paddingBottom: 8,
                               paddingRight: 8,
                               width: 0,
                               height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
