//
//  SearchView.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 28/02/2022.
//

import UIKit

class SearchView: UICollectionReusableView , UISearchBarDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var myController : Controller?
    
    
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        self.myController = controller
        self.searchBar.delegate = self
    }
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        searchBar.becomeFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            guard var search = self.searchBar.text, self.searchBar.text != "" else {
                return
            }
            search = search.replacingOccurrences(of: " ", with: "+")
            let newRouting = Routing()
    
            let route = SearchByNameRoutingEntry(countryCode: search)
    
            _ = newRouting.route(routingEntry: route, fromController: self.myController!, animated: true)
        }
    
}
