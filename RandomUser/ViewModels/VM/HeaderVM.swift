//
//  SearchViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 27/02/2022.
//



import Foundation

class HeaderVM: CollectionCellViewModel {
    
    var routingEntry: RoutingEntry?
    
    var size: (width: Float, height: Float) {
        return (150, 90)
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "SearchView"
    lazy var reuseIdentifier: String = String(describing: self)
    
    var userCollection : UsersCollections
    
    init(userCollection: UsersCollections) {
        
        self.userCollection = userCollection
    }
    
}

