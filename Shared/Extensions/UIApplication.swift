//
//  UIApplication.swift
//  tunki-user
//
//  Created by Juliana Loaiza Labrador on 10/24/19.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension UIApplication {
    static var loginAnimation: UIView.AnimationOptions = .transitionFlipFromRight
    static var logoutAnimation: UIView.AnimationOptions = .transitionCrossDissolve

    /// Funcion para setear el rootViewController
    public static func setRootView(_ viewController: UIViewController,
                                   options: UIView.AnimationOptions = .transitionFlipFromRight,
                                   animated: Bool = true,
                                   duration: TimeInterval = 0.5,
                                   completion: (() -> Void)? = nil) {
        guard animated else {
            UIApplication.shared.keyWindow?.rootViewController = viewController
            return
        }
        if let keyWindow = UIApplication.shared.keyWindow {

            UIView.transition(with: keyWindow, duration: duration, options: options, animations: {
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                UIApplication.shared.keyWindow?.rootViewController = viewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { _ in
                completion?()
            })
        }
    }
}
