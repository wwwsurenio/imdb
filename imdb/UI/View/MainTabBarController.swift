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
        
        let navigationVC = FavoritesViewController()
        let profileVC = ProfileViewController()
        
        
        let profileImage = UIImage(systemName: "person.crop.circle")
        let navigationImage = UIImage(systemName: "safari")
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "Favorites", image: navigationImage, tag: 1)
        
        setViewControllers([navigationVC, profileVC], animated: false)
    }
}

