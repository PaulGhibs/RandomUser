//
//  ResultsSections.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 28/02/2022.
//

import Foundation


class ResultSection: CollectionSection {
    var headerVM: CollectionCellViewModel?
    var footerVM: CollectionCellViewModel?
    // properties from section protocol
    var title: String?
    var position: Int
    var cellsVM: [CellViewModel]
    
    
    init(userCollection: UsersCollections) {
        
        self.position = 1
        self.title = ""
        self.cellsVM = [CellViewModel]()
        // init country cell vm
        
        for user in userCollection.results {
            
            self.cellsVM.append(HomeCellVM(userInfos: user, routingEntry: UserDetailRouting(user: user)))
            
        }
    }
}

