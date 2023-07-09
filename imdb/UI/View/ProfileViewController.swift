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
        
        let imageView = UIImageView()
        // Set the image for the UIImageView
        imageView.image = UIImage(named: "image.png")
        
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 29),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "SF Pro Display", size: 24)
        textView.textAlignment = .left
        
        let line1Text = "⦿ Access more than 1,000,000 people reviews ⭐\n"
        let line2Text = "⦿ Save your library 📚\n"
        let line3Text = "⦿ Share your thoughts 🎤"
        let bulletText = "\(line1Text)\(line2Text)\(line3Text)"
        let attributedString = NSMutableAttributedString(string: bulletText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 20, options: [:])]
        paragraphStyle.defaultTabInterval = 20
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: textView.font ?? UIFont.systemFont(ofSize: 24),
            .paragraphStyle: paragraphStyle
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.length))
        textView.attributedText = attributedString
        
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 29),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])
        
        textView.sizeToFit()
        textView.layoutIfNeeded()
        
        
        let signInButton = UIButton()
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.backgroundColor = .white
        signInButton.layer.cornerRadius = 16
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.black.cgColor
        
        let registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = .white
        registerButton.layer.cornerRadius = 16
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(signInButton)
        view.addSubview(registerButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            signInButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 35),
            signInButton.widthAnchor.constraint(equalToConstant: 176),
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            registerButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 35),
            registerButton.widthAnchor.constraint(equalToConstant: 176),
            registerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: signInButton.trailingAnchor, constant: 8)
        ])
        
        
        let facebookButton = UIButton()
        facebookButton.setTitle("Continue with Facebook", for: .normal)
        facebookButton.setTitleColor(.white, for: .normal)
        facebookButton.backgroundColor = UIColor(red: 0, green: 0.52, blue: 1, alpha: 1)
        facebookButton.layer.cornerRadius = 16

        view.addSubview(facebookButton)

        facebookButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            facebookButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            facebookButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        
        let appleButton = UIButton()
        appleButton.setTitle("Continue with Apple", for: .normal)
        appleButton.setTitleColor(.white, for: .normal)
        appleButton.backgroundColor = .black
        appleButton.layer.cornerRadius = 16

        view.addSubview(appleButton)

        appleButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            appleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            appleButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 16),
            appleButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        let termsTextView = UITextView()
        termsTextView.isEditable = false
        termsTextView.isScrollEnabled = false
        termsTextView.backgroundColor = .clear
        termsTextView.font = UIFont(name: "SF Pro Display", size: 16)
        termsTextView.textAlignment = .center

        let termsText = "By continuing, you are accepting our\nTerms of Service and Privacy"
        let attributedText = NSMutableAttributedString(string: termsText)

        let colorAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 0, green: 0.52, blue: 1, alpha: 1)
        ]
        attributedText.addAttributes(colorAttributes, range: (termsText as NSString).range(of: "Terms of Service"))
        attributedText.addAttributes(colorAttributes, range: (termsText as NSString).range(of: "Privacy"))

        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        termsTextView.attributedText = attributedText

        view.addSubview(termsTextView)

        termsTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            termsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsTextView.widthAnchor.constraint(equalToConstant: 321),
            termsTextView.heightAnchor.constraint(equalToConstant: 44),
            termsTextView.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 16)
        ])

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
