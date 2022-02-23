//
//  UIViewController+Controller.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//

import UIKit


// extension ViewController for protocol controller
extension UIViewController: Controller {
    
    var presentedController: Controller? {
        return self.presentedViewController
    }
    
    var navController: NavController? {
        return self.navigationController
    }
        
    func present(controller: Controller, animated: Bool, completion: @escaping () -> ()) {
        guard let viewController = controller as? UIViewController else {
            return
        }
        self.present(viewController,
                     animated: animated,
                     completion: completion)
    }
        
    func dismissController(animated: Bool, completion: @escaping () -> ()) {
        self.dismiss(animated: animated, completion: completion)
    }
    
}
