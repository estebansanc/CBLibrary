//
//  UITextField+CursorLocation.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 09/01/2020.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit

extension UITextField {
    func setCursorLocation(_ location: Int) {
        if let cursorLocation = position(from: beginningOfDocument, offset: location) {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.selectedTextRange = strongSelf.textRange(from: cursorLocation, to: cursorLocation)
            }
        }
    }
}
