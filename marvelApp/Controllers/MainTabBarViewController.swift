//
//  ViewController.swift
//  marvelApp
//
//  Created by idaira aleman quintana on 16/3/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let homeController = UINavigationController(rootViewController: HomePageViewController())
        let favourite = UINavigationController(rootViewController: FavouriteViewController())
        
        homeController.title = "Home"
        favourite.title = "Favourite"
        
        setViewControllers([homeController,favourite], animated: true)
        
        guard let items = self.tabBar.items else {return}
        let images = ["house","suit.heart"]
        
        for x in 0...1{
            items[x].image = UIImage(systemName: images[x])
        }
    }
    
    


}

