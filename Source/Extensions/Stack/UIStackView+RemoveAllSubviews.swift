//
//  UIStackView+RemoveAllSubviews.swift
//  QualityControl
//
//  Created by Esteban Sánchez on 10/03/2022.
//

import Foundation
import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach({
            $0.removeFromSuperview()
        })
    }
    
    func insertArrangedSubview(_ view: UIView, beforeView: UIView) {
        guard let index = self.arrangedSubviews.firstIndex(of: beforeView) else {
            return
        }
        self.insertArrangedSubview(view, at: index)
    }
}
