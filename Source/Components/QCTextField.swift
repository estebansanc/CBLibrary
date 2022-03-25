//
//  QCTextField.swift
//  QualityControl
//
//  Created by Esteban Sánchez on 12/02/2022.
//

import UIKit

class QCTextField: UITextField {
    // MARK: - Properties
    
    let textPadding = UIEdgeInsets(
        top: 8,
        left: 8,
        bottom: 8,
        right: 8
    )
    
    // MARK: Padding
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearence()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
    }
    
    final func setupAppearence() {
        self.cornerRadius = 8
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    var borderWidth: CGFloat {
        return 1
    }
    
    var borderColor: CGColor  {
        return UIColor.black.cgColor
    }
}
