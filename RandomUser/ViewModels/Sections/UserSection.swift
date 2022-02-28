//
//  UserSection.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 27/02/2022.
//

import Foundation



class UserSection: CollectionSection {
    var headerVM: CollectionCellViewModel?
    
    var footerVM: CollectionCellViewModel?
    
    var position: Int
    
    var title: String?
    
    var cellsVM: [CellViewModel]
    
    var heightForHeader = 20
  
    
    
    init(user: UserInfos) {
        self.position = 1
        self.title = ""
      
        self.cellsVM = [CellViewModel]()
        
        
        let usercellVM = UserCellVM(userPage: user)
        
        self.cellsVM.append(usercellVM)

        
    }
}
