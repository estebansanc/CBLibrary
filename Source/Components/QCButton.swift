//
//  QCButton.swift
//  QualityControl
//
//  Created by Esteban Sánchez on 12/02/2022.
//

import UIKit

class QCButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted ? selectedBackgroundColorStyle : backgroundColorStyle
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? .lightGray : backgroundColorStyle
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearence()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
    }
    
    private func setupAppearence() {
        self.titleLabel?.font = fontStyle
        self.backgroundColor = backgroundColorStyle
        self.cornerRadius = 10
        setTitleColor(foregroundColorStyle, for: .normal)
        setTitleColor(selectedForegroundColorStyle, for: .highlighted)
        
        if let defaultWidth = defaultWidth {
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: defaultWidth)
            ])
        }
        
        if let defaultHeight = defaultHeight {
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: defaultHeight)
            ])
        }
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let text = isUppercased ? title?.uppercased() : title
        super.setTitle(text, for: [])
    }
    
    var foregroundColorStyle: UIColor? {
        return .label
    }
    
    var selectedForegroundColorStyle: UIColor? {
        return .label
    }
    
    var backgroundColorStyle: UIColor? {
        return .label
    }
    
    var selectedBackgroundColorStyle: UIColor? {
        return .label
    }
    
    var fontStyle: UIFont {
        return .systemFont(ofSize: 12)
    }
    
    var isUppercased: Bool {
        return false
    }
    
    var defaultHeight: CGFloat? {
        return nil
    }
    
    var defaultWidth: CGFloat? {
        return nil
    }
}
