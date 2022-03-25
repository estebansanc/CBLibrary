//
//  UIView+UIImageView.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 24/10/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension UIView {
    var snapshot: UIImage? {
        return UIGraphicsImageRenderer(size: bounds.size).image { _ in
            // Draw view in that context
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }
    
    func takeScreenshot() -> UIImage? {
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
    
    func setBorder() {
        let borderWidth = CGFloat(1)
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: -borderWidth, width: self.frame.width, height: self.frame.height + borderWidth)
        borderLayer.borderColor = ColorsApp.skeletonBackground.get().cgColor
        borderLayer.borderWidth = 1
        self.layer.addSublayer(borderLayer)
    }
}
