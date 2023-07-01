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
        
        let profileVC = ProfileViewController()
        let favoriteVC = FavoritesViewController()
        
        let profileImage = UIImage(systemName: "person.crop.circle")
        let favoriteImage = UIImage(systemName: "safari")
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, tag: 0)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorites", image: favoriteImage, tag: 1)
        
        self.setViewControllers([profileVC, favoriteVC], animated: false)
        self.tabBar.isHidden = false
    }
}
