//
//  UIImage+Buffer.swift
//  tunki-user
//
//  Created by Pedro Miguel Vera Rafael on 7/14/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit
import AVFoundation

extension UIImage {
    
    convenience init?(sampleBuffer: CMSampleBuffer, orientation: UIImage.Orientation = .upMirrored) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly)
        
        defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly) }
        let baseAddress = CVPixelBufferGetBaseAddress(pixelBuffer)
        let width = CVPixelBufferGetWidth(pixelBuffer)
        let height = CVPixelBufferGetHeight(pixelBuffer)
        let bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
        guard let context = CGContext(data: baseAddress, width: width, height: height,
                                      bitsPerComponent: 8, bytesPerRow: bytesPerRow,
                                      space: colorSpace, bitmapInfo: bitmapInfo.rawValue) else { return nil }
        
        guard let cgImage = context.makeImage() else {
            return nil
        }
        
        self.init(cgImage: cgImage, scale: 1, orientation: orientation)
    }
}
