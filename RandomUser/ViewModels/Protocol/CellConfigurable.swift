//
//  CellConfigurable.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//


import Foundation
import UIKit


@objc protocol CellConfigurable {
    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}


extension UICollectionReusableView: CellConfigurable {
    //
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
}

extension UITableViewCell: CellConfigurable {
    // each tableviewcell conforms to cellconfigurable
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
}


