//
//  UIViewController+NavigationBar.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 22/07/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIViewController {

	func hideNavigationBar() {
		let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
		statusBar.backgroundColor = R.color.navigationBarBackground()
		view.addSubview(statusBar)

		navigationController?.setIsHidden(true)
	}

	func showNavigationBar() {
		navigationController?.setIsHidden(false)
	}

	func setNavigationBarHidden(_ isHidden: Bool) {
		if isHidden {
			hideNavigationBar()
		} else {
			showNavigationBar()
		}
	}

	func addNavigationRightButton(target: Any?, action: Selector, image: UIImage?) {
		navigationItem.addRightButton(target: target, action: action, image: image)
	}

	func updateNavigationRightButtonImage(image: UIImage?) {
		navigationItem.updateRightButtonImage(image: image)
	}

	func addNavigationLeftButton(target: Any?, action: Selector, image: UIImage?) {
		navigationItem.addLeftButton(target: target, action: action, image: image)
	}

	func setNavigationBarStyle() {
		navigationController?.addStyle()
	}

	func setNavigationBarBackButton() {
		navigationItem.addBackButton()
	}

	func hideNavigationBarBackButton() {
		navigationItem.hideBackButton()
	}
}
