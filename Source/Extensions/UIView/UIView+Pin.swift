//
//  UIView+Pin.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 16/04/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIView {
	func pinViewTo(view: UIView, topConstraint: CGFloat = 0.0, bottomConstraint: CGFloat = 0.0,
				   leadingConstraint: CGFloat = 0.0, trailingConstraint: CGFloat = 0.0) {
		self.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view,
						   attribute: .leading, multiplier: 1.0, constant: leadingConstraint).isActive = true

		NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view,
						   attribute: .trailing, multiplier: 1.0, constant: trailingConstraint).isActive = true

		NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view,
						   attribute: .top, multiplier: 1.0, constant: topConstraint).isActive = true

		NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view,
						   attribute: .bottom, multiplier: 1.0, constant: bottomConstraint).isActive = true
	}
}
