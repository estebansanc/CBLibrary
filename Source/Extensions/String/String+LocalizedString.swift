//
//  String+LocalizedString.swift
//  tunki-user
//
//  Created by Juliana Loaiza Labrador on 30/12/19.
//  Copyright © 2019 InDigital. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: emptyString)
    }
}
