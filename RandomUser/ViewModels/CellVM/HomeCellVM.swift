//
//  HomeCellVM.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//



import Foundation

class HomeCellVM: CollectionCellViewModel {

    var routingEntry: RoutingEntry?
    var size: (width: Float, height: Float) {
        return (150, 153)
    }
    var indexPath: IndexPath?
    var nibName: String? = "HomeViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var userInfos : UserInfos
    
    init(userInfos: UserInfos, routingEntry: RoutingEntry) {
        self.userInfos = userInfos
        self.routingEntry = routingEntry
    }

}




