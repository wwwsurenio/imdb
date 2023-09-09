    //
    //  UserProfileViewController.swift
    //  imdb
    //
    //  Created by User01 on 9/9/23.
    //

    import Foundation
    import UIKit

    class UserProfileViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the background color to white
            view.backgroundColor = .white
            
            // Create a label to display "User Profile"
            let label = UILabel()
            label.text = "User Profile"
            label.font = UIFont.systemFont(ofSize: 24)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            // Add the label to the view
            view.addSubview(label)
            
            // Center the label in the view
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    }
