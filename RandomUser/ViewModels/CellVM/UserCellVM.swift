//
//  UserCellVM.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 27/02/2022.
//



import Foundation

class UserCellVM: CollectionCellViewModel {
    var size: (width: Float, height: Float) {
        return (150, 153)
    }
    
    var nibName: String? = "UserPageCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var user: UserInfos
    
    init(userPage : UserInfos) {
        self.user = userPage
    }
}
