//
//  FileHelper.swift
//  tunki-user
//
//  Created by Danny Alva on 5/10/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit

class FileHelper: NSObject {
    
    public func getFileToPath(path: String, type: String) -> Data {
        if let filePath = Bundle.main.path(forResource: path, ofType: type),
            let contentFile = try? String(contentsOfFile: filePath),
            let data = contentFile.data(using: .utf8) {
            return data
        }
        return Data()
    }
}
