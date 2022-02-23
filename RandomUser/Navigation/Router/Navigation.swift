//
//  Navigation.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//

import Foundation

@objc protocol NavController: Controller {
    // protocol nav controller for moving from one controller to another
    func push(controller: Controller, animated: Bool)
    func popController(animated: Bool)
    
}
