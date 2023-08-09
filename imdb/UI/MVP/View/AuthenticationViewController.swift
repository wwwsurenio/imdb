//
//  AuthenticationViewController.swift
//  imdb
//
//  Created by User01 on 1/7/23.
//

import Foundation
import UIKit

class AuthenticationViewController: UIViewController {
    
    var presenter: AuthenticationPresenterInput
    
    init(presenter: AuthenticationPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Set up the UI elements
        let titleLabel = setupTitleLabel(label: "Authorization")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 54)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image.png")
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
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
        
        let signInButton = createRoundButton(title: "Sign in")
        let registerButton = createRoundButton(title: "Register")
        setupSignAndRegisterButtons(
            signInButton: signInButton,
            registerButton: registerButton,
            textView: textView,
            superview: view)
        
        
        let facebookButton = createSocialLoginButton(
            title: "Continue with Facebook",
            buttonColor: UIColor(red: 0, green: 0.52, blue: 1, alpha: 1),
            textColor: .white)
        
        view.addSubview(facebookButton)
        
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            facebookButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            facebookButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        
        let appleButton = createSocialLoginButton(
            title: "Continue with Apple",
            buttonColor: .black,
            textColor: .white)
        
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
        
        let attributedText = AttributedStringHelper.makeTermsAttributedString()
        termsTextView.attributedText = attributedText
        
        view.addSubview(termsTextView)
        
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            termsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsTextView.widthAnchor.constraint(equalToConstant: 321),
            termsTextView.heightAnchor.constraint(equalToConstant: 44),
            termsTextView.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 16)
        ])
        
        signInButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc func didTapLoginButton() {
        // Call the createRequestToken function through the presenter
        presenter.createRequestToken()
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
    
    func setupTitleLabel(label: String) -> UILabel {
        let titleLabel = TitleLabel()
        titleLabel.text = label
        return titleLabel
    }
    
    func createRoundButton(title: String) -> UIButton {
        let roundButton = RoundButton()
        roundButton.setTitle(title, for: .normal)
        return roundButton
    }
    
    func createSocialLoginButton(title: String, buttonColor: UIColor, textColor: UIColor) -> UIButton {
        let socialLoginButton = RoundButton()
        socialLoginButton.setTitle(title, for: .normal)
        socialLoginButton.backgroundColor = buttonColor
        socialLoginButton.setTitleColor(textColor, for: .normal)
        return socialLoginButton
    }
    
    private func setupSignAndRegisterButtons(signInButton: UIButton, registerButton: UIButton, textView: UITextView, superview: UIView) {
        superview.addSubview(signInButton)
        superview.addSubview(registerButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 17),
            signInButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 35),
            signInButton.widthAnchor.constraint(equalToConstant: 176),
            
            registerButton.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
            registerButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 35),
            registerButton.widthAnchor.constraint(equalToConstant: 176),
        ])
        
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: signInButton.trailingAnchor, constant: 8)
        ])
    }
    
    func activateConstraints(for views: [UIView],
                             topAnchor: NSLayoutYAxisAnchor,
                             leadingAnchor: NSLayoutXAxisAnchor,
                             trailingAnchor: NSLayoutXAxisAnchor,
                             bottomAnchor: NSLayoutYAxisAnchor,
                             constants: UIEdgeInsets = .zero) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor, constant: constants.top),
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constants.left),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constants.right),
                view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constants.bottom)
            ])
        }
    }
    
    
    // Завести свой класс Label
    // Настроить в отдельной функции NSAttributedString
    // Вынести настройки блоков в отдельные функции
    // Завести свой класс для социальных кнопок
}

extension AuthenticationViewController: AuthenticationPresenterOutput {
    func openAuthURL(url: URL) {
        let authViewController = AuthWKWebViewController(url: url)
        navigationController?.pushViewController(authViewController, animated: true)
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showErrorMessage(_ message: String) {
        
    }
    
    func showProfileScreen() {
        
    }
}


