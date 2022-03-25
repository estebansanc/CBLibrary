//
//  UIView+AddSubviewWithAnimation.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 11/08/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIView {
	public func addSubviewWithAnimation(_ subview: UIView?) {
		guard let segmentSubview = subview else { return }

		segmentSubview.frame = self.bounds
		segmentSubview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.subviews.forEach { $0.removeFromSuperview() }

		UIView.transition(with: self, duration: 0.25,
						  options: [.transitionCrossDissolve], animations: { [weak self] in
							self?.addSubview(segmentSubview)
						  }, completion: nil)
	}

}
