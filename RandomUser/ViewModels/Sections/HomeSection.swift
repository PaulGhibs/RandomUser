//
//  HomeSection.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import Foundation

// MARK: - HomeSection

class HomeSection: TableSection {
    // properties from section protocol
    var heightForHeader = 20
    var title: String?
    var position: Int
    var cellsVM: [CellViewModel]
    
    init() {
        self.position = 1
        self.title = ""
        self.cellsVM = [CellViewModel]()
        // init country cell vm
        
        for _ in 0..<10 {
            let people = HomeCellVM(name: "")
            self.cellsVM.append(people)
            
        }
        
        
        
    }
}
