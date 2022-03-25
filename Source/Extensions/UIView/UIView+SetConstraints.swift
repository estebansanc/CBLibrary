//
//  UIView+SetConstraints.swift
//  tunki-user
//
//  Created by Esteban Sánchez on 25/01/2022.
//  Copyright © 2022 InDigital. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func setHeight(_ constant: CGFloat) -> UIView {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: constant)
        ])
        
        return self
    }
    
    @discardableResult
    func setHeight(_ constant: CGFloat, relatedBy: NSLayoutConstraint.Relation) -> UIView {
        switch relatedBy {
        case .lessThanOrEqual:
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            ])
        case .equal:
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: constant)
            ])
        case .greaterThanOrEqual:
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            ])
        @unknown default:
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: constant)
            ])
        }
        
        return self
    }
    
    @discardableResult
    func setWidth(_ constant: CGFloat) -> UIView {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: constant)
        ])
        
        return self
    }
    
    @discardableResult
    func setAspectRatio(_ multiplier: CGFloat) -> UIView {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.heightAnchor,
                                        multiplier: multiplier)
        ])
        
        return self
    }
}
