//
//  RoundButton.swift
//  imdb
//
//  Created by User01 on 12/7/23.
//

import Foundation
import UIKit

final class RoundButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 44
        return size
    }
}
