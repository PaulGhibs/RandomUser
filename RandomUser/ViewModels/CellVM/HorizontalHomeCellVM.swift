//
//  HorizontalHomeCellVM.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 25/02/2022.
//

import Foundation


class HorizontalHomeCellVM : TableCellViewModel {
    var routingEntry: RoutingEntry?
    var height: Float = 530
    var indexPath: IndexPath?
    var nibName: String? = "TableHeaderSection"
    lazy var reuseIdentifier: String = String(describing: self)
    var horizontalGrid: HorizontalGrid
    
    init(horizontalGrid: HorizontalGrid) {
        self.horizontalGrid = horizontalGrid
    }
    

}
