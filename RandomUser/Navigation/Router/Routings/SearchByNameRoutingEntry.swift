//
//  SearchByNameRoutingEntry.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 27/02/2022.
//

import Foundation


class SearchByNameRoutingEntry: RoutingEntry {
   
    
    var countryCode : String
    
    init(countryCode: String) {
        self.countryCode = countryCode
        
    }
    
    var completionBlock: (() -> Void)?
    var navigationStyle: NavigationStyle {
        return .push
        
    }
    
    var viewController: Controller? {
        let viewModel = SearchViewModel(title: countryCode, url: "https://randomuser.me/api/?nat=\(countryCode)&results=20&seed=abc", apiService: RandomUserService())

        return BaseCollectionViewController(viewModel: viewModel, compositionalLayout: ResultsLayout())
        
    }
    
}
