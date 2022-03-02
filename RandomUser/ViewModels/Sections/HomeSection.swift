//
//  HomeSection.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import Foundation

// MARK: - HomeSection

class HomeSection: CollectionSection {
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
            self.headerVM = HeaderVM(userCollection: userCollection)
            self.cellsVM.append(HomeCellVM(userInfos: user, routingEntry: UserDetailRouting(user: user)))

        }
    }
}
