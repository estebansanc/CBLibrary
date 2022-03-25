//
//  String+Random.swift
//  tunki-user
//
//  Created by Pedro Miguel Vera Rafael on 12/30/19.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension String {

    static func randomAlphaNumeric(length: Int) -> String {
        var partial: [Character] = []
        let chars: [Character] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".map({ $0 })

        for _ in 0..<length {
            let rand = Int(arc4random_uniform(UInt32(chars.count)))
            partial.append(chars[rand])
        }

        return String(partial)
    }
}
