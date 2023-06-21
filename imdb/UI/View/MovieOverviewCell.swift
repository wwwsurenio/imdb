//
//  MovieTitleCell.swift
//  imdb
//
//  Created by User01 on 18/6/23.
//

import Foundation
import UIKit

class MovieOverviewCell: UITableViewCell {
    
    var movieOverview: String? {
        didSet {
            movieOverviewLabel.text = movieOverview
        }
    }
    
    private let movieOverviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieOverviewLabel)
        
        movieOverviewLabel.anchor(top: contentView.topAnchor,
                               left: contentView.leftAnchor,
                               bottom: contentView.bottomAnchor,
                               right: contentView.rightAnchor,
                               paddingTop: 16,
                               paddingLeft: 32,
                               paddingBottom: 16,
                               paddingRight: 32,
                               width: 0,
                               height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
