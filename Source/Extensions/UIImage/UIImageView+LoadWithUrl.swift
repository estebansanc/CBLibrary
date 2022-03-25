//
//  Extensions.swift
//  tunki-user
//
//  Created by Juliana Loaiza Labrador on 9/19/19.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

	func loadWithCache(_ urlString: String?, placeholderImage: UIImage? = nil) {
		guard let urlString = urlString, let url = URL(string: urlString) else {
			return
		}
        
		if let image = UIImage(named: urlString) {
			self.image = image
		} else {
			self.kf.setImage(
				with: url,
				placeholder: placeholderImage,
				options: [
					.scaleFactor(UIScreen.main.scale),
					.transition(.fade(1)),
					.cacheOriginalImage
				])
		}
	}
    
    func setImageColor(color: UIColor?) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func setImageGreyed() {
        guard let selfImage = self.image, let ciImage = CIImage(image: selfImage) else { return }
        let blackAndWhiteImage = ciImage.applyingFilter("CIColorControls", parameters: ["inputSaturation": 0])
        self.image = UIImage(ciImage: blackAndWhiteImage)
    }
    
    func addImagePadding(xPoint: CGFloat, yPoint: CGFloat) -> UIImage? {
        let width: CGFloat = self.bounds.size.width + xPoint
        let height: CGFloat = self.bounds.size.height + yPoint
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
        let origin: CGPoint = CGPoint(x: (width - self.bounds.size.width) / 2, y: (height - self.bounds.size.height) / 2)
        
        draw(CGRect(origin: origin, size: self.bounds.size))
        
        let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imageWithPadding
    }
}
