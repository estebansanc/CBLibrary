//
//  UIViewController+InstantiateView.swift
//  ParkApp
//
//  Created by Esteban Sánchez on 06/02/2022.
//

import UIKit

extension UIView {
    public static func instantiateView<T: UIView>(_ withCustomSetup: ((T) -> Void)? = nil) -> (() -> T) {
        return {
            let view = T()
            view.translatesAutoresizingMaskIntoConstraints = false
            withCustomSetup?(view)
            return view
        }
    }
    
    static func stack(_ views: UIView...) -> QCStackView {
        let view = QCStackView(arrangedSubviews: views)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension QCStackView {
    func vertical() -> QCStackView {
        self.axis = .vertical
        return self
    }
    
    func horizontal() -> QCStackView {
        self.axis = .horizontal
        return self
    }
    
    func centered() -> QCStackView {
        self.alignment = .center
        return self
    }
    
    func top() -> QCStackView {
        self.alignment = .top
        return self
    }
    
    func trailing() -> QCStackView {
        self.alignment = .trailing
        return self
    }
    
    func fillEqually() -> QCStackView {
        self.distribution = .fillEqually
        return self
    }
    
    func fillProportionally() -> QCStackView {
        self.distribution = .fillProportionally
        return self
    }
    
    func spacing(_ spacing: CGFloat) -> QCStackView {
        self.spacing = spacing
        return self
    }
}
