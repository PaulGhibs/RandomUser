//
//  CellConfigurable.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import Foundation
import UIKit

protocol CellConfigurable: AnyObject {
    // configure the cell
    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    // action when cell is pressed
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}
