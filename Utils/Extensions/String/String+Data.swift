//
//  String+Data.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 06/11/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension String {
    func base64urlToData() -> Data? {
        var result = Data(base64Encoded: emptyString)
        
        if let dataUrl = URL(string: String(format: "data:application/octet-stream;base64,%@", "\(self.utf8)")) {
            if let decodedData = try? Data(contentsOf: dataUrl) {
                result = decodedData
            }
        }
        
        return result
    }
}
