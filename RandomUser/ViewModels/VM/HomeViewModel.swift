//
//  HomeViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import Foundation

class HomeViewModel: ViewModel  {
    
    
    var titleTabBar: String = "Random User"
    
    var shouldDisplayBackButton = false
    
    
    var sections: [Section] = []
    
    
    func loadData(callback: @escaping (Error?) -> ()) {
        
        self.sections.append(HomeSection())
        callback(nil)
    }
    
}
