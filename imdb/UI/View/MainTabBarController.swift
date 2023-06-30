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
        let profileVC = ProfileVC()
        let favoriteVC = FavoriteVC()
        
        self.setViewControllers([profileVC, favoriteVC], animated: false)
    }
}

class ProfileVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class FavoriteVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
