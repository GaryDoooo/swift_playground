//
//  UIView+Constraints.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import UIKit

extension UIView {
    func constrainToCenterOfParent(withAspectRatio aspectRatio: CGFloat) {
        let parent = superview!
        
        let centerX = self.centerXAnchor.constraint(equalTo: parent.centerXAnchor)
        centerX.priority = .required
        let centerY = self.centerYAnchor.constraint(equalTo: parent.centerYAnchor)
        centerY.priority = .required
        let aspectRatio = self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: aspectRatio)
        aspectRatio.priority = .required
        let lessThanOrEqualWidth = self.widthAnchor.constraint(lessThanOrEqualTo: parent.widthAnchor)
        lessThanOrEqualWidth.priority = .required
        let lessThanOrEqualHeight = self.widthAnchor.constraint(lessThanOrEqualTo: parent.heightAnchor)
        lessThanOrEqualHeight.priority = .required
        
        let equalWidth = self.widthAnchor.constraint(equalTo: parent.widthAnchor)
        equalWidth.priority = .defaultHigh
        let equalHeight = self.heightAnchor.constraint(equalTo: parent.heightAnchor)
        equalHeight.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            centerX,
            centerY,
            aspectRatio,
            lessThanOrEqualWidth,
            lessThanOrEqualHeight,
            equalWidth,
            equalHeight
        ])
    }
}
