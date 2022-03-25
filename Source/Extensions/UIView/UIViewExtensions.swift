//
//  UIViewExtensions.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 15/05/2021.
//

import UIKit
//import SkeletonView

// MARK:- Add Constraints with Format
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

// MARK:- Add Embedded
extension UIView {
    
    func addEmbedded(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.addConstraint(self.topAnchor.constraint(equalTo: view.topAnchor))
        self.addConstraint(self.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        self.addConstraint(self.leftAnchor.constraint(equalTo: view.leftAnchor))
        self.addConstraint(self.rightAnchor.constraint(equalTo: view.rightAnchor))
    }
}

// MARK:- Load View from Nib
extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

// MARK:- Set Gradient Background
extension UIView {
    func setLinearGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }
}

// MARK:- Add Skeletonables
extension UIView {
    static func setSkeletonableViews(views: UIView...){
        views.forEach({
            $0.isSkeletonable = true;
            $0.skeletonCornerRadius = 10
        })
    }

    static func showSkeletonIn(views: UIView...){
        views.forEach({
            $0.isSkeletonable = true;
            $0.showSkeleton();
            $0.startSkeletonAnimation()
        })
    }

    static func hideSkeletonIn(views: UIView...){
        views.forEach({
            $0.hideSkeleton();
            $0.stopSkeletonAnimation()
        })
    }
}

// MARK:- Unselect Buttons
extension UIView {
    static func unselectButtons(buttons: [UIButton]) {
        buttons.forEach({ $0.isSelected = false })
    }
}

// MARK:- Make Separator
extension UIView {
    static func makeSeparator(color: UIColor = UIColor.white.withAlphaComponent(0.3), height: CGFloat = 2) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth]
        NSLayoutConstraint.activate([
            ///Separator Line View
            view.heightAnchor.constraint(equalToConstant: height)
        ])
        return view
    }
}

// MARK: - Pin to edges

enum edgePin {
    case toLeading(inset: CGFloat = 0)
    case toTrailing(inset: CGFloat = 0)
    case toBottom(inset: CGFloat = 0)
    case toTop(inset: CGFloat = 0)
}

extension UIView {
    func pinToSuperview(_ edges: [edgePin]) {
        guard let superview = superview else { return }
        for edge in edges {
            switch edge {
            case .toLeading(let inset):
                NSLayoutConstraint.activate([
                    leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: inset)
                ])
            case .toTrailing(let inset):
                NSLayoutConstraint.activate([
                    trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -inset)
                ])
            case .toBottom(let inset):
                NSLayoutConstraint.activate([
                    bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset)
                ])
            case .toTop(let inset):
                NSLayoutConstraint.activate([
                    topAnchor.constraint(equalTo: superview.topAnchor, constant: inset)
                ])
            }
        }
    }
}
