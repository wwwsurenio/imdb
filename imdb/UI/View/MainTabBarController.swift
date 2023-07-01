//
//  MainTabBarController.swift
//  imdb
//
//  Created by User01 on 30/6/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoriteVC = FavoritesViewController()
        let profileVC = ProfileViewController()
        
        
        let profileImage = UIImage(systemName: "person.crop.circle")
        let favoriteImage = UIImage(systemName: "safari")
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, tag: 0)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorites", image: favoriteImage, tag: 1)
        
        setViewControllers([favoriteVC, profileVC], animated: false)
    }
}

