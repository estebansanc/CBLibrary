//
//  Data+JsonSerialization.swift
//  agora-express
//
//  Created by Gonzalo Quarin on 10/2/20.
//  Copyright © 2020 Gonzalo Quarin. All rights reserved.
//

import UIKit

extension Data {
    var printableJson: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object,
                                                   options: [.prettyPrinted]),

            let prettyPrinted = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            else { return nil }

        return prettyPrinted
    }
}
