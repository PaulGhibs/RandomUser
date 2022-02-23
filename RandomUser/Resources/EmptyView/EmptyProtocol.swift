//
//  EmptyProtocol.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import UIKit

// All properties for display an "Empty View"
protocol EmptyProtocol {
    
    // MARK: - Properties
    var attributedTitle: NSAttributedString? { get }
    var descriptionText: String? { get }
    var attributedDescription: NSAttributedString? { get }
    var attributedButtonTitle: NSAttributedString? { get }
    var image: UIImage? { get }
    var imageTintColor: UIColor? { get }
    var buttonBackgroundImage: UIImage? { get }
    var backgroundColor: UIColor { get }
    var customView: UIView? { get }
    var verticalOffset: CGFloat { get }
    var contentOffset: CGFloat { get }
    var verticalSpace: CGFloat { get }
    var completionBlock: (() -> Void)? { get set }
}

extension EmptyProtocol {
    
    var attributedTitle: NSAttributedString? {
        return nil
    }
    
    var descriptionText: String? {
        return nil
    }
    
    var attributedDescription: NSAttributedString? {
        return nil
    }
    
    var attributedButtonTitle: NSAttributedString? {
        return nil
    }
    
    var image: UIImage? {
        return nil
    }
    
    var imageTintColor: UIColor? {
        return nil
    }
    
    var buttonBackgroundImage: UIImage? {
        return nil
    }
    
    var backgroundColor: UIColor {
        return  .systemBackground
    }
    
    var customView: UIView? {
        return nil
    }
    
    var verticalOffset: CGFloat {
        return 0
    }
    
    var contentOffset: CGFloat {
        return 0
    }
    
    var verticalSpace: CGFloat {
        return 40
    }
    
}

