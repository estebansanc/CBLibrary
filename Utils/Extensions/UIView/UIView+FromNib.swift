//
//  UIView+FromNib.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 2/25/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T? {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)?[0] as? T
    }

	func loadViewFromNib(_ nibName: String) {
		let nib = UINib(nibName: nibName, bundle: nil)
		let instance = nib.instantiate(withOwner: self, options: nil).first as? UIView

		guard let view = instance else {
			return
		}

		view.frame = self.bounds
		self.addSubview(view)
	}
}
