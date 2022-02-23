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
        let view = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),
                                           type: .lineScalePulseOut,
                                           color: .label,
                                           padding: 16)
        view.startAnimating()
        return view
    }
    
    let tabBarOffset: CGFloat
    
    
    init(tabBarOffset: CGFloat) {
        self.tabBarOffset = tabBarOffset
    }
    
}
