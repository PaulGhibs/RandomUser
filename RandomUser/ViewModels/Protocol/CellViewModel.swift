//
//  CellViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//


import Foundation

@objc protocol CellViewModel {
    var nibName: String? { get set }
    var reuseIdentifier: String { get set }
    var indexPath: IndexPath? { get set }
    var routingEntry: RoutingEntry? { get set }
}

protocol TableCellViewModel: CellViewModel {
    // cell Height
    var height: Float { get }
    // cell estimated Height
}



protocol CollectionCellViewModel: CellViewModel {
    var size: (width: Float, height: Float) { get }
    
}
