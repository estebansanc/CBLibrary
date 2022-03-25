//
//  ColorsApp.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 2/26/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit

enum ColorsApp: String {
    case primaryBlue
    case primaryCoral
    case primaryCoralDisabled
    
    case textfield
    case textfieldDetail
    case textfieldFocused
    case textfieldPlaceholder
    case textfieldDisabled
    case textfieldError
    
    case keyboardBackground
    case keyboardTitle
    case keyboardError
    
    case linkButtonSelected
    case collectionViewCellSelected
    
    case topAlertMessageError
    case topAlertMessageWarning
    case topAlertMessageInfo
    
    case baseRegular
    case baseRegularLight
    case baseRegularDisabled
    case baseSemiboldDark
    case skeletonBackground
    
    case notificationViewCellNoRead
    case notificationBackgroundAction
    
    case bottomLineCellDark
    
    case borderColorAnimation
    
    case white
    
    // New colors
    
    case black1
    case backgroundLight1
    case backgroundLight2
    case cyanDark1
    case cyanDark2
    case cyanLight1
    case cyanLight2
    case cyanLight3
    case cyanLight4
    case gray1
    case gray2
    case gray3
    case gray4
    case gray5
    case textColor
    case iconRelleno1
    case iconRelleno2
    case payActionColor
    case colorDone
    case colorStandby
    case colorWrong
    case colorDestacados
}

extension ColorsApp {
    
    func get() -> UIColor {
        return UIColor(named: self.rawValue) ?? UIColor()
    }
}
