//
//  HomeCell.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import UIKit

class HomeCell: UITableViewCell, CellConfigurable, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var myController : UIViewController?

    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        self.myController = controller
        self.searchBar.delegate = self
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        searchBar.becomeFirstResponder()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
