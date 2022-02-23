//
//  ViewController.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // home : index = 0
    // wishlist : index = 1
    enum Indexes: Int {
        case Home
        case SearchList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tab Home
        let vc1 = BasicTableViewController(viewModel: HomeViewModel())
        // tab SearchByName
        
        let vc2 = BasicTableViewController(viewModel: )
        
        // use CustomeNavigationController
        let nav1 = HomeController(rootViewController: vc1)
        let nav2 = SearchController(rootViewController: vc2)
        
        // tabs Icons
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "sparkle.magnifyingglass"), tag: 2)
        tabBar.tintColor = .lightGray
        
        setViewControllers([nav1, nav2], animated: true)
    }
    
}




