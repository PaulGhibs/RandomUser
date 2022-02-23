//
//  SearchController.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import UIKit

class SearchController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar.prefersLargeTitles = false
        navigationBar.barTintColor = .lightGray
        navigationBar.tintColor = .blue
        
        
    }

}
