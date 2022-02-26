//
//  EmptyLoader.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation
import NVActivityIndicatorView

// Display a Loader when view is loading
struct EmptyLoader: EmptyProtocol {
    var completionBlock: (() -> Void)?
    
    
    var verticalOffset: CGFloat {
        return tabBarOffset
    }
    
    var customView: UIView? {
        let view = NVActivityIndicatorView(frame: CGRect(x: 5, y: 10, width: 150, height: 150),
                                           type: .pacman,
                                           color: .secondaryLabel,
                                           padding: 16)
        view.startAnimating()
        return view
    }
    
    let tabBarOffset: CGFloat
    
    
    init(tabBarOffset: CGFloat) {
        self.tabBarOffset = tabBarOffset
    }
    
}
