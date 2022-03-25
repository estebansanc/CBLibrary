//
//  QCStackView.swift
//  QualityControl
//
//  Created by Esteban Sánchez on 12/02/2022.
//

import UIKit

class QCStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAppearence() {
        self.spacing = 16
    }
}
