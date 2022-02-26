//
//  UImageView + Extension.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 26/02/2022.
//

import SDWebImage
import UIKit

extension UIImageView {
    func setImageUrl(_ url : URL?) {
        guard let url = url else {
            return
        }
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "search_u"))
    }
}
