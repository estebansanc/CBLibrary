//
//  UIView+Shapes.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 9/02/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIView {

	func addCircle(atPoint point: CGPoint, color: UIColor?, radius: CGFloat, alpha: CGFloat = 1.0) {
		let divisor: CGFloat = 2.0
		let xCoord = point.x - radius / divisor
		let yCoord = point.y - radius / divisor
		let circleRect = CGRect(x: xCoord, y: yCoord, width: radius, height: radius)
		let circleView = UIView(frame: circleRect)
		circleView.layer.cornerRadius = radius / divisor
		circleView.alpha = alpha
		circleView.backgroundColor = color
		self.addSubview(circleView)
	}

}
