//
//  TitleLabel.swift
//  imdb
//
//  Created by User01 on 19/7/23.
//

import Foundation
import UIKit


final class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        textAlignment = .center
        textColor = .black
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
