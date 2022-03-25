//
//  UIViewController+NativeAlert.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 22/07/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIViewController {

	func showAlertSettings(title: String?, message: String?, action: @escaping () -> Void?) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { _ in
			action()
		}))

		alert.addAction(UIAlertAction(title: "Ir a ajustes", style: .default, handler: { _ in
			self.openUrl(url: UIApplication.openSettingsURLString)
		}))

		self.present(alert, animated: true)
	}

	func showAlert(title: String?, message: String?) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
		self.present(alert, animated: true)
	}

	@objc func openUrl(url: String) {
		if let urlOpen = URL(string: url) {
			if UIApplication.shared.canOpenURL(urlOpen) {
				UIApplication.shared.open(urlOpen)
			}
		}
	}
}
