//
//  UIImage+Base64.swift
//  tunki-user
//
//  Created by Pedro Miguel Vera Rafael on 7/9/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit
import AVFoundation

enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

extension UIImage {
    func toBase64(format: ImageFormat) -> String? {
        var imageData: Data?
        
        switch format {
        case .png:
            imageData = self.pngData()
        case .jpeg(let compression):
			imageData = self.jpegData(compressionQuality: compression)
        }
        
        return imageData?.base64EncodedString()
    }
}
