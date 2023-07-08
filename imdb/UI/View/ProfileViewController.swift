//
//  ProfileViewController.swift
//  imdb
//
//  Created by User01 on 1/7/23.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        // Set up the UI elements
        let titleLabel = UILabel()
        titleLabel.text = "Authorization"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 54)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true

        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])


        
        let imageView = UIImageView(frame: CGRect(x: 50, y: 150, width: 200, height: 200))
        // Set the image for the UIImageView
        imageView.image = UIImage(named: "test.png")
        view.addSubview(imageView)
        
        let line1Label = UILabel(frame: CGRect(x: 0, y: 400, width: view.frame.width, height: 30))
        line1Label.textAlignment = .left
        line1Label.font = UIFont(name: "SF Pro Display", size: 24)
        let line1Text = "⦿ Access more than 1,000,000 people reviews ⭐"
        let attributedString1 = NSMutableAttributedString(string: line1Text)
        attributedString1.addAttribute(NSAttributedString.Key.paragraphStyle, value: bulletStyle(), range: NSRange(location: 0, length: attributedString1.length))
        line1Label.attributedText = attributedString1
        view.addSubview(line1Label)
        
        let line2Label = UILabel(frame: CGRect(x: 0, y: 450, width: view.frame.width, height: 30))
        line2Label.textAlignment = .left
        line2Label.font = UIFont(name: "SF Pro Display", size: 24)
        let line2Text = "⦿ Save your library 📚"
        let attributedString2 = NSMutableAttributedString(string: line2Text)
        attributedString2.addAttribute(NSAttributedString.Key.paragraphStyle, value: bulletStyle(), range: NSRange(location: 0, length: attributedString2.length))
        line2Label.attributedText = attributedString2
        view.addSubview(line2Label)
        
        let line3Label = UILabel(frame: CGRect(x: 0, y: 500, width: view.frame.width, height: 30))
        line3Label.textAlignment = .left
        line3Label.font = UIFont(name: "SF Pro Display", size: 24)
        let line3Text = "⦿ Share your thoughts 🎤"
        let attributedString3 = NSMutableAttributedString(string: line3Text)
        attributedString3.addAttribute(NSAttributedString.Key.paragraphStyle, value: bulletStyle(), range: NSRange(location: 0, length: attributedString3.length))
        line3Label.attributedText = attributedString3
        view.addSubview(line3Label)
        
        let signInButton = UIButton(frame: CGRect(x: 50, y: 550, width: 150, height: 40))
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.backgroundColor = .white
        signInButton.layer.cornerRadius = 16
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(signInButton)
        
        let registerButton = UIButton(frame: CGRect(x: 225, y: 550, width: 150, height: 40))
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = .white
        registerButton.layer.cornerRadius = 16
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(registerButton)
        
        let facebookButton = UIButton(frame: CGRect(x: 50, y: 610, width: view.frame.width - 100, height: 40))
        facebookButton.setTitle("Continue with Facebook", for: .normal)
        facebookButton.setTitleColor(.white, for: .normal)
        facebookButton.backgroundColor = .blue
        facebookButton.layer.cornerRadius = 16
        view.addSubview(facebookButton)
        
        let appleButton = UIButton(frame: CGRect(x: 50, y: 670, width: view.frame.width - 100, height: 40))
        appleButton.setTitle("Continue with Apple", for: .normal)
        appleButton.setTitleColor(.white, for: .normal)
        appleButton.backgroundColor = .black
        appleButton.layer.cornerRadius = 16
        view.addSubview(appleButton)
        
        let termsLabel = UILabel(frame: CGRect(x: 0, y: 730, width: view.frame.width, height: 30))
        termsLabel.text = "By continuing, you accept our Terms of Service and Privacy"
        termsLabel.textAlignment = .center
        view.addSubview(termsLabel)
    }
    
    private func bulletStyle() -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 20, options: [:])]
        paragraphStyle.defaultTabInterval = 20
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 20
        paragraphStyle.paragraphSpacingBefore = 5
        return paragraphStyle
    }
    
}
