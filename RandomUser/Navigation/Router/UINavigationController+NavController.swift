//
//  UINavigationController+NavController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//

import UIKit

extension UINavigationController: NavController {
    
    func push(controller: Controller, animated: Bool) {
        guard let viewController = controller as? UIViewController else {
            return
        }
        self.pushViewController(viewController,
                                animated: animated)
    }
    
    func popController(animated: Bool) {
        self.popViewController(animated: animated)
    }
    
    
}
