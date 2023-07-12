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
            movieBlurImageView.image = movieThumb?
                .addBlurredImageUnderneath(posterSize: .init(
                width: UIScreen.main.bounds.width - 2 * .leadingOffset,
                height: .posterHeight))?
            .curvedImageWithRadius(radius: 32)
            movieThumbImageView.image = movieThumb?.curvedImageWithRadius(radius: 32)
        }
    }
    
    private let movieThumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let movieBlurImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.setNeedsLayout()
        return imageView
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light) // Choose the desired blur style
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(movieBlurImageView)
        contentView.addSubview(movieThumbImageView)
//        contentView.addSubview(blurView)
        
        movieBlurImageView.anchor(top: contentView.topAnchor,
                                   left: contentView.leftAnchor,
                                   bottom: contentView.bottomAnchor,
                                   right: contentView.rightAnchor,
                                   paddingTop: 8,
                                   paddingLeft: .leadingOffset,
                                   paddingBottom: 0,
                                   paddingRight: .leadingOffset,
                                   height: .posterHeight)
        
        movieThumbImageView.anchor(top: contentView.topAnchor,
                                   left: contentView.leftAnchor,
                                   bottom: contentView.bottomAnchor,
                                   right: contentView.rightAnchor,
                                   paddingTop: 40,
                                   paddingLeft: .leadingOffset,
                                   paddingBottom: 0,
                                   paddingRight: .leadingOffset,
                                   height: .posterHeight)
        
//        blurView.frame = movieThumbImageView.bounds
        movieThumbImageView.addSubview(blurView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CGFloat {
    static let posterHeight: CGFloat = 408
    static let leadingOffset: CGFloat = 8
}
