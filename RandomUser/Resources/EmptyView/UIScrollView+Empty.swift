//
//  UIScrollView+Empty.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation
import EmptyDataSet_Swift



// Extension UIScrollView for Display an Empty View
extension UIScrollView {
    
    func updateEmptyScreen(emptyReason: EmptyProtocol) {
        self.emptyDataSetView { emptyView in
            emptyView.titleLabelString(emptyReason.attributedTitle)
                .customView(emptyReason.customView)
                .verticalOffset(emptyReason.verticalOffset)
                .detailLabelString(emptyReason.attributedDescription)
                .image(emptyReason.image)
                .buttonTitle(emptyReason.attributedButtonTitle, for: .normal)
                .buttonBackgroundImage(emptyReason.buttonBackgroundImage, for: .normal)
                .dataSetBackgroundColor(emptyReason.backgroundColor)
                .didTapDataButton {
                    emptyReason.completionBlock?()
                }
                .detailLabelString(emptyReason.attributedDescription)
                .verticalSpace(emptyReason.verticalSpace)
        }
        
    }
}
