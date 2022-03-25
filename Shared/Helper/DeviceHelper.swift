//
//  DeviceHelper.swift
//  tunki-user
//
//  Created by Pedro Miguel Vera Rafael on 11/4/19.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

class DeviceHelper {
    
    struct ScreenSize {
        static let screenWidth = UIScreen.main.bounds.size.width
        static let screenHeight = UIScreen.main.bounds.size.height
        static let screenMaxLength = max(ScreenSize.screenWidth, ScreenSize.screenHeight)
        static let screenMinLength = min(ScreenSize.screenWidth, ScreenSize.screenHeight)
    }
    
    struct DeviceType {
        static let isIPhone4OrLess: Bool = (UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength < 568.0)
        static let isIPhone5: Bool = (UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 568.0)
        static let isIPhone6: Bool = (UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 667.0)
        static let isIPhone6P: Bool = (UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 736.0)
        static let isIPhoneX: Bool = (UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 812)
        static let isIPhoneXsMax: Bool = (UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 896)
        static let isIPhoneXr: Bool = (UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.screenMaxLength == 896)
    }
    
    class func getIdentifierVendor() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

}
