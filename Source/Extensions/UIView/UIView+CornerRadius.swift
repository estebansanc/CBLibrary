//
//  UIView+CornerRadius.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 01/10/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import Foundation
import UIKit

class DesignableViewDeprecated: UIView {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            
            var color: UIColor?
            if let borderColor = layer.borderColor {
                color = UIColor.init(cgColor: borderColor)
            }
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor {
        get {
            var color = UIColor.white
            if let shadowColor = layer.shadowColor {
                color = UIColor.init(cgColor: shadowColor)
            }
            return color
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat, boundsContainer: CGRect) {
        let path = UIBezierPath(roundedRect: boundsContainer, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func pinViewInsideContainer(_ container: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal,
                           toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal,
                           toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal,
                           toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal,
                           toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.repeatCount = 1
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func addDashedBorder(strokeColor: UIColor = UIColor.red) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = 2
        // passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment
        shapeLayer.lineDashPattern = [4,3]
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    func addBottomShadow(shadowSize: CGFloat = 5, shadowDistance: CGFloat = 0) {
        let width: CGFloat = self.frame.size.width
        let height: CGFloat = self.frame.size.height
        
        let contactRect = CGRect(x: -shadowSize,
                                 y: height - (shadowSize * 0.4) + shadowDistance,
                                 width: width + shadowSize * 2,
                                 height: shadowSize)
        self.layer.shadowPath = UIBezierPath(rect: contactRect).cgPath
        self.layer.shadowOpacity = 0.2
    }

    func addShadow(color: UIColor? = .black, opacity: Float = 1.0, offset: CGSize = CGSize(width: 2, height: 2)) {
		self.layer.masksToBounds = false
		self.layer.shadowColor = color?.cgColor
		self.layer.shadowOpacity = opacity
		self.layer.shadowOffset = CGSize(width: 1, height: 1)
		self.layer.shadowRadius = self.cornerRadius
	}
}
