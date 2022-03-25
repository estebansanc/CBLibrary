//
//  UIImage+Crop.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 9/02/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension UIImage {

	func cropTo(outputRect: CGRect, originalImage: UIImage?) -> UIImage? {
		guard let originalImage = originalImage, let cgImage = originalImage.cgImage else { return nil }

		let width = CGFloat(cgImage.width)
		let height = CGFloat(cgImage.height)

		let cropRect = CGRect(x: outputRect.origin.x * width,
							  y: outputRect.origin.y * height,
							  width: outputRect.size.width * width,
							  height: outputRect.size.height * height)

		if let croppedCGImage = cgImage.cropping(to: cropRect) {
			return UIImage(cgImage: croppedCGImage, scale: 1.0, orientation: originalImage.imageOrientation)
		}

		return nil
	}
}
