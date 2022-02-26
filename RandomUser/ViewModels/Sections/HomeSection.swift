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
    var horizontalGrids : [HorizontalGrid]

    
    init(horizontalGrids: [HorizontalGrid]) {
        self.horizontalGrids = horizontalGrids
        self.position = 1
        self.title = ""
        self.cellsVM = [CellViewModel]()
        // init country cell vm
        
        cellsVM.append(HomeCellVM())
        
        
        for hortalGrid in horizontalGrids {
            self.cellsVM.append(HorizontalHomeCellVM(horizontalGrid: hortalGrid))
        }
         
        
        
        
    }
}
