//
//  UINavigationController+NavigationItems.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 31/03/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UINavigationController {

	func addStyle() {
		self.navigationBar.addStyle()
	}

	func setIsHidden(_ hidden: Bool) {
		self.setNavigationBarHidden(hidden, animated: true)
	}

}

extension UINavigationItem {

	func addCloseButtomItem(target: Any?, action: Selector?) {
		self.leftBarButtonItem = UIBarButtonItem(image: R.image.navigationBarCloseIcon(),
												 style: .plain,
												 target: target,
												 action: action)
	}

	func addRightButton(target: Any?, action: Selector, image: UIImage?) {
		let button = UIButton()
		button.setImage(image, for: .normal)
		button.addTarget(target, action: action, for: .touchUpInside)
		self.rightBarButtonItem = UIBarButtonItem(customView: button)
	}

	func updateRightButtonImage(image: UIImage?) {
		guard let button = self.rightBarButtonItem?.copy() as? UIButton else {
			return
		}

		button.setImage(image, for: .normal)
		self.rightBarButtonItem = UIBarButtonItem(customView: button)
	}

	func addLeftButton(target: Any?, action: Selector, image: UIImage?) {
		let button = UIButton()
		button.setImage(image, for: .normal)
		button.addTarget(target, action: action, for: .touchUpInside)
		self.leftBarButtonItem = UIBarButtonItem(customView: button)
	}

	func removeRightButton() {
		self.rightBarButtonItem = nil
	}

	func hideBackButton() {
		self.setHidesBackButton(true, animated: true)
	}

	func addBackButton() {
		self.backBarButtonItem = UIBarButtonItem(title: emptyString,
												 style: .plain,
												 target: nil, action: nil)
	}
}

extension UINavigationBar {

	func addStyle() {
		self.titleTextAttributes = [
			.foregroundColor: R.color.navigationBarTitle() ?? .black]

		self.barTintColor = R.color.navigationBarBackground()
		self.tintColor = R.color.navigationBarTintColor()

		self.shadowImage = R.image.navigationBarShadowImage()?
			.resizableImage(withCapInsets: UIEdgeInsets.zero,
							resizingMode: .stretch)

		self.isTranslucent = false
	}
}
