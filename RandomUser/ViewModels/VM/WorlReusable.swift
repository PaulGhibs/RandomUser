//
//  WorlReusable.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 28/02/2022.
//

import Foundation

class WorldReusable: CollectionCellViewModel {
    
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (150, 90)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "WorldReusableView"
    lazy var reuseIdentifier: String = String(describing: self)
    
    
}
