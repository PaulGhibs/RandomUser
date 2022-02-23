//
//  SearchViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation

class SearchViewModel: ViewModel  {
    
    
    var titleTabBar: String = "Search Page"
    
    var shouldDisplayBackButton = false
    
    
    var sections: [Section] = []
    
    
    func loadData(callback: @escaping (Error?) -> ()) {
        
        self.sections.append(HomeSection())
        callback(nil)
    }
    
}
