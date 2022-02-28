//
//  UserPageCell.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 28/02/2022.
//

import UIKit

class UserPageCell: UICollectionViewCell {

    
    @IBOutlet weak var ImageCover: UIImageView!
    
    
    @IBOutlet weak var UserName: UILabel!
    
    @IBOutlet weak var UserAdress: UILabel!
    
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var userPage: UserInfos?
    
    override func layoutSubviews() {
        ImageCover.contentMode = .scaleAspectFill
        ImageCover.clipsToBounds = true
        ImageCover.layer.cornerRadius = 70
    }
    
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? UserCellVM else {
            return
        }
        self.userPage = cellVM.user
        self.UserName.text = "👼 Name: \(cellVM.user.name.first + " " + cellVM.user.name.last)"
        
        self.ImageCover.setImageUrl(URL(string: cellVM.user.picture.large))
        //
        self.UserAdress.text = " 🌍 Country : \(cellVM.user.location.country)"
        
        self.userPhone.text = " 📞  Phone:  \(cellVM.user.phone)"
        self.email.text = " 📩 Email: \(cellVM.user.email)"
        
    }
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed
     
    }
}
