//
//  CellViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//


import Foundation

protocol CellViewModel: AnyObject {
    // the CellViewModel's nibName
    var nibName: String? { get set }
    // the TableViewCell ReuseIdentifier
    var reuseIdentifier: String { get set }
    // the indexPath for know the section and the row
    var indexPath: IndexPath? { get set }
    // the action when a cell is pressed ( push, present, etc... a controller)
    var routingEntry: RoutingEntry? { get set }
}

protocol TableCellViewModel: CellViewModel {
    // cell Height
    var height: Float { get }
    // cell estimated Height
}


