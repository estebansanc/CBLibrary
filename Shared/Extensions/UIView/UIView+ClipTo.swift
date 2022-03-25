//
//  UIView+ClipToSuperview.swift
//  tunki-user
//
//  Created by Esteban Sánchez on 15/11/2021.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIView {
    func clipToSuperview(insets: UIEdgeInsets = .zero, safeAreaRelative: Bool = false) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        if safeAreaRelative {
            let guide: UILayoutGuide
            guide = superview.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: guide.topAnchor, constant: insets.top),
                leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: insets.left),
                trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -insets.right),
                bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -insets.bottom)
            ])
            
        } else {
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
                leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom)
            ])
        }
    }
    
    @discardableResult
    func clipTo(_ view: UIView,
                top: CGFloat? = nil,
                leading: CGFloat? = nil,
                bottom: CGFloat? = nil,
                trailing: CGFloat? = nil,
                isSafeAreaRelative: Bool = true
    ) -> UIView {
        view.addSubview(self)
        
        if let top = top {
            clipToViewsTop(view, constant: top, isSafeAreaRelative: isSafeAreaRelative)
        }
        if let leading = leading {
            clipToViewsLeading(view, constant: leading, isSafeAreaRelative: isSafeAreaRelative)
        }
        if let bottom = bottom {
            clipToViewsBottom(view, constant: bottom, isSafeAreaRelative: isSafeAreaRelative)
        }
        if let trailing = trailing {
            clipToViewsTrailing(view, constant: trailing, isSafeAreaRelative: isSafeAreaRelative)
        }
        
        return self
    }
    
    @discardableResult
    func clip(to view: UIView,
              fromAttribute: NSLayoutConstraint.Attribute,
              toAttribute: NSLayoutConstraint.Attribute,
              relatedBy: NSLayoutConstraint.Relation = .equal,
              withConstant: CGFloat = 0
    ) -> UIView {
        NSLayoutConstraint(item: self,
                           attribute: fromAttribute,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: toAttribute,
                           multiplier: 1,
                           constant: withConstant)
            .isActive = true
        
        return self
    }
}

// MARK: - ClipTo+OneSide

extension UIView {
    @discardableResult
    func clipToViewsTop(_ view: UIView,
                        constant: CGFloat,
                        isSafeAreaRelative: Bool
    ) -> UIView {
        if isSafeAreaRelative {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant)
            ])
        } else {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
            ])
        }
        
        return self
    }
    
    @discardableResult
    func clipToViewsBottom(_ view: UIView,
                        constant: CGFloat,
                        isSafeAreaRelative: Bool
    ) -> UIView {
        if isSafeAreaRelative {
            NSLayoutConstraint.activate([
                self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant)
            ])
        } else {
            NSLayoutConstraint.activate([
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
            ])
        }
        
        return self
    }
    @discardableResult
    func clipToViewsLeading(_ view: UIView,
                        constant: CGFloat,
                        isSafeAreaRelative: Bool
    ) -> UIView {
        if isSafeAreaRelative {
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant)
            ])
        } else {
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
            ])
        }
        
        return self
    }
    
    @discardableResult
    func clipToViewsTrailing(_ view: UIView,
                        constant: CGFloat,
                        isSafeAreaRelative: Bool
    ) -> UIView {
        if isSafeAreaRelative {
            NSLayoutConstraint.activate([
                self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: constant)
            ])
        } else {
            NSLayoutConstraint.activate([
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
            ])
        }
        
        return self
    }
}
