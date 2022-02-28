//
//  EmptyTextButton.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 25/02/2022.
//

import Foundation
import UIKit

struct EmptyTextAndButton: EmptyProtocol {
    
    // Vertical Offset
    var verticalOffset: CGFloat {
        return tabBarOffset
    }
    
    // tabBarOffSet
    let tabBarOffset: CGFloat
    
    // Title
    let customTitle: String
    
    // Font title
    var attributedTitle: NSAttributedString? {
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : UIColor.label];
        return NSAttributedString(string: self.customTitle,
                                  attributes: attributedStringColor)
    }
    
    // Description
    var customDescription : String
    
    var attributedDescription : NSAttributedString? {
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : UIColor.label];
        return NSAttributedString(string: self.customDescription,
                                  attributes: attributedStringColor)
    }
    
    // Principal Image
    let image: UIImage?
    
    // Font title button
    var attributedButtonTitle: NSAttributedString? {
        var attributes: [NSAttributedString.Key: Any] = [:]
        let font = UIFont.boldSystemFont(ofSize: 17)
        let textColor = UIColor(ciColor: .white)
        
        attributes[NSAttributedString.Key.font] = font
        attributes[NSAttributedString.Key.foregroundColor] = textColor
        
        return NSAttributedString(string: self.buttonTitle,
                                  attributes: attributes)
    }
    
    // Background Color button
    var buttonBackgroundImage: UIImage? {
        let image = UIImage(named: "button")
        return image!
    }
    
    // completionBlock if needed
    var completionBlock: (() -> Void)?
    
    // title Button
    let buttonTitle: String
    
    init(tabBarOffset: CGFloat,
         customTitle: String,
         customDescription : String,
         image : UIImage,
         buttonTitle : String,
         completionBlock : (() -> Void)? ) {
        self.tabBarOffset = tabBarOffset
        self.customTitle = customTitle
        self.customDescription = customDescription
        self.image = image
        self.buttonTitle = buttonTitle
        self.completionBlock = completionBlock
    }
    
}


