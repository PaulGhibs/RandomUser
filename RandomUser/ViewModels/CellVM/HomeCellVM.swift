//
//  HomeCellVM.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//



import Foundation

class HomeCellVM: TableCellViewModel {

    var routingEntry: RoutingEntry?
    var height: Float {
        return 80
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "HomeCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var name: String
    

    init(name: String) {
        self.name = name
      
    }
}




