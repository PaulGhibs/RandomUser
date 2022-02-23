//
//  Routing.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//

import Foundation
import UIKit

// defining routing by conforming to navigator protocol
class Routing: NSObject, Navigator {
    
    // MARK: - Navigator
    
    var lastRoutingEntry: RoutingEntry?
    
    func visibleViewController() -> Controller? {
        guard let window = UIApplication.shared.delegate?.window  else {
            return nil
        }
        return self.visibleViewController(window!.rootViewController)
    }
    
    func visibleViewController(_ rootViewController: Controller?) -> Controller? {
        
        if let rootNavigationController = rootViewController as? UINavigationController {
            let lastViewController: UIViewController? = rootNavigationController.viewControllers.last
            return self.visibleViewController(lastViewController)
        } else if let rootTabBarController = rootViewController as? UITabBarController {
            let selectedViewController: UIViewController? = rootTabBarController.selectedViewController
            return visibleViewController(selectedViewController)
        }
        
        if rootViewController?.presentedController == nil {
            return rootViewController
        } else {
            return self.visibleViewController(rootViewController?.presentedController)
        }
    }
    
    func route(routingEntry: RoutingEntry,
               fromController: Controller,
               animated: Bool = true) -> Navigator {
        
        let viewControllerToDisplay = routingEntry.viewController
        
        // Navigate on main thread to avoid crashes
        DispatchQueue.main.async(execute: {() -> Void in
            switch routingEntry.navigationStyle {
            case .push:
                
                var fromNavigationController: UINavigationController? = fromController as? UINavigationController
                
                if let navigationController = fromController.navController as? UINavigationController {
                    fromNavigationController = navigationController
                }
                if let aDisplay = viewControllerToDisplay {
                    fromNavigationController?.pushViewController(aDisplay as! UIViewController, animated: animated)
                }
                
                break
                
            case .pop:
                fromController.navController?.popController(animated: animated)
                break
                
            case .modal:
                if let aDisplay = viewControllerToDisplay {
                    fromController.present(controller: aDisplay,
                                           animated: animated,
                                           completion: {() -> Void in
                                            routingEntry.completionBlock?()
                                           })
                }
                
                break
                
                
                
            case .dismiss:
                fromController.dismissController(animated: animated,
                                                 completion: {() -> Void in
                                                    routingEntry.completionBlock?()
                                                 })
                break
                
            }
            
        })
        
        self.lastRoutingEntry = routingEntry
        return self
    }
}
