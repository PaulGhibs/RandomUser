//
//  HomeViewCell.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 28/02/2022.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    var userPage: UserInfos?

    override func layoutSubviews() {
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 25
    }
    

    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? HomeCellVM else {
            return
        }
        self.userPage = cellVM.userInfos
        self.userName.text = "\(cellVM.userInfos.name.first + " " + cellVM.userInfos.name.last)"
        self.userImage.setImageUrl(URL(string: cellVM.userInfos.picture.large))
        //
        
        
        
        
    }
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed
        guard let routingEntry = cellViewModel.routingEntry,
              let navController = controller.navigationController else {
                  return
              }
        let newRouting = Routing()
        _ = newRouting.route(routingEntry: routingEntry,
                             fromController: navController)
    }

}
