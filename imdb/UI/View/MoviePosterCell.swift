//
//  MoviePosterCell.swift
//  imdb
//
//  Created by User01 on 18/6/23.
//

import Foundation
import UIKit

class MoviePosterCell: UITableViewCell {
    
    var movieThumb: UIImage? {
        didSet {
            movieThumbImageView.image = movieThumb
            setNeedsLayout()
        }
    }
    
    private let movieThumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieThumbImageView)
    
        movieThumbImageView.anchor(top: contentView.topAnchor,
                                   left: contentView.leftAnchor,
                                   bottom: contentView.bottomAnchor,
                                   right: contentView.rightAnchor,
                                   paddingTop: 8,
                                   paddingLeft: 8,
                                   paddingBottom: 8,
                                   paddingRight: 8,
                                   height: 408)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
