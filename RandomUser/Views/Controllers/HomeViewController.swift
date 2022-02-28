//
//  HomeViewController.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import UIKit

// customed Navigation Controller
class HomeController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar.prefersLargeTitles = false
        navigationBar.barTintColor = .lightGray
        navigationBar.tintColor = .blue
        
    }
    
   
}
