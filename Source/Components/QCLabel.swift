//
//  TitleLabel.swift
//  QualityControl
//
//  Created by Esteban Sánchez on 12/02/2022.
//

import UIKit

class QCLabel: UILabel {
    override var text: String? {
        didSet {
            self.setAttributes()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFont()
    }
    
    final func setupFont() {
        self.font = fontStyle
        self.textColor = colorStyle
        setAttributes()
    }
    
    internal func setAttributes() {
        if !attributedStyle.isEmpty {
            let text = isUppercased ? text?.uppercased() : text
            self.attributedText = NSMutableAttributedString(string: text ?? emptyString,
                                                            attributes: attributedStyle)
        }
    }
    
    var colorStyle: UIColor? {
        return .label
    }
    
    var fontStyle: UIFont {
        return .systemFont(ofSize: 12)
    }
    
    var attributedStyle: [NSAttributedString.Key: Any]  {
        return [:]
    }
    
    var isUppercased: Bool {
        return false
    }
}
