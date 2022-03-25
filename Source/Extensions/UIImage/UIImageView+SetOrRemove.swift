//
//  UIImageView+SetOrRemove.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 7/07/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIImageView {
	func setOrRemoveFromSuperview(_ image: UIImage?) {
		if let image = image {
			self.image = image
		} else {
			self.removeFromSuperview()
		}
	}
}
