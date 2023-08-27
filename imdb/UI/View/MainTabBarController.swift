//
//  MainTabBarController.swift
//  imdb
//
//  Created by User01 on 30/6/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    let profileImage = UIImage(systemName: "person.crop.circle")
    let navigationImage = UIImage(systemName: "safari")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the MovieViewController
        let movieControllerInput = MovieController()
        let movieViewController = MovieViewController(movieController: movieControllerInput)
        let movieNavigationController = UINavigationController(rootViewController: movieViewController)
        movieNavigationController.tabBarItem = UITabBarItem(title: nil, image: navigationImage, tag: 0)
        
        // Create the AuthenticationViewController and connect with presenter
        let authenticationModel = AuthenticationModel()
        let presenter = AuthenticationPresenter(authenticationModel: authenticationModel)
        let authenticationViewController = AuthenticationViewController(presenter: presenter)
        
        authenticationModel.output = presenter
        presenter.output = authenticationViewController
        
        let profileNavigationController = UINavigationController(rootViewController: authenticationViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: nil, image: profileImage, tag: 1)
        profileNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        // Set the view controllers of the tab bar controller
        self.viewControllers = [movieNavigationController, profileNavigationController]
        
        // Set the background color of the tab bar to white
        tabBar.barTintColor = .white
        
    }
}

