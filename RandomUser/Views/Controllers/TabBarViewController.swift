//
//  ViewController.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//


import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // tab bar appearance
        view.backgroundColor = .systemBackground
        self.tabBar.tintColor = UIColor.darkGray
        self.tabBar.backgroundColor = UIColor.systemBackground
        self.tabBar.barStyle = .default
        tabBar.unselectedItemTintColor = UIColor.lightGray
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 10)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        setupVCs()
        
        
    }
    
    
    
    // MARK: - Methods
    func setupVCs() {
        viewControllers = [
            // two controllers the search one and the favorite
            createNavController(for: BaseCollectionViewController(viewModel: HomeViewModel(apiService: RandomUserService()), compositionalLayout: HomeLayout()), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "homekit")!),
            
            
        ]
    }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
    
}







