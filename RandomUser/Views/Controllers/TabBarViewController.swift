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
        let vc1 = BasicTableViewController(viewModel: HomeViewModel(apiService: RandomUserService()))
        // tab SearchByName
        
        
        // use CustomeNavigationController
        let nav1 = HomeController(rootViewController: vc1)
        
        // tabs Icons
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 1)
        
        tabBar.tintColor = .lightGray
        
        setViewControllers([nav1], animated: true)
    }
    
}




