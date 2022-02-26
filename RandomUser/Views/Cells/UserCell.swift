//
//  UserCell.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 26/02/2022.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAdress: UILabel!
    @IBOutlet weak var userMail: UILabel!
    
    var userPage: UserInfos?
    
    static let identifier = "UserCell"

    static func nib() -> UINib {
        return UINib(nibName: "UserCell", bundle: nil)
    }
   
    override func layoutSubviews() {
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 25
    }
    
    func configure(userPage: UserInfos) {
        self.userPage = userPage
        self.userName.text = "\(userPage.name.first + userPage.name.last)"
        self.userAdress.text = userPage.location.city
        self.userMail.text = userPage.email
        
        self.userImage.setImageUrl(URL(string: userPage.picture.medium))
        
    }

    
    func cellPressed(userPage: UserInfos, from controller: UIViewController) {
        
    }
    
    
}
