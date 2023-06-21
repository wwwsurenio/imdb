//
//  MoviePosterCell.swift
//  imdb
//
//  Created by User01 on 18/6/23.
//

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
        return imageView
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light) // Choose the desired blur style
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieThumbImageView)
        contentView.addSubview(blurView)
        
        movieThumbImageView.anchor(top: contentView.topAnchor,
                                   left: contentView.leftAnchor,
                                   bottom: contentView.bottomAnchor,
                                   right: contentView.rightAnchor,
                                   paddingTop: 8,
                                   paddingLeft: 8,
                                   paddingBottom: 8,
                                   paddingRight: 8,
                                   height: 395.6)
        
        blurView.frame = movieThumbImageView.bounds
        movieThumbImageView.addSubview(blurView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
