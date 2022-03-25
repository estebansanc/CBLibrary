//
//  NSObject+ClassName.swift
//  tunki-user
//
//  Created by Pedro Miguel Vera Rafael on 6/24/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit

extension NSObject {

    public static var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}
