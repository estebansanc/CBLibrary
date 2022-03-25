//
//  String+Base64.swift
//  tunki-user
//
//  Created by Pedro Miguel Vera Rafael on 1/8/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit

extension String {
    
    /// Decode a String from Base64. Returns nil if unsuccessful.
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    /// Encode a String to Base64
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
