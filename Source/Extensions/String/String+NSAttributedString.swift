//
//  String+NSAttributedString.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 13/12/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension String {

	// MARK: Deprecated

	private func addAttribute(primaryFont: UIFont?, color: UIColor = UIColor(white: 0.0, alpha: 1.0), attributedFont: UIFont?, location: Int, length: Int, attributedColor: UIColor) -> NSAttributedString {

		let attributedString = NSMutableAttributedString(string: self, attributes: [
			.font: primaryFont ?? UIFont(),
			.foregroundColor: color
		])
        let range = NSRange(location: location, length: length)
        
		attributedString.addAttribute(.font,
									  value: attributedFont ?? UIFont(),
									  range: range)
        attributedString.addAttribute(.foregroundColor,
                                      value: attributedColor,
                                      range: range)
		return attributedString
	}

    func addAttribute(primaryFont: UIFont?, color: UIColor = UIColor(white: 0.0, alpha: 1.0), attributedFont: UIFont?, text: String, attributedColor: UIColor = .black) -> NSAttributedString {

		if let stringRange = self.range(of: text), self.contains(text) {
			let location = stringRange.lowerBound.utf16Offset(in: self)
            return self.addAttribute(primaryFont: primaryFont, color: color, attributedFont: attributedFont, location: location, length: text.count, attributedColor: attributedColor)
		}

        return self.addAttribute(primaryFont: primaryFont, color: color, attributedFont: attributedFont, location: 0, length: 0, attributedColor: attributedColor)
	}
}


// MARK: - New version

extension String {

	public func addAttribute(font: UIFont?, color: UIColor?) -> NSMutableAttributedString {
		let textRange: NSRange = NSRange(location: 0, length: self.count)

		let attributedString = NSMutableAttributedString(string: self)
		attributedString.addAttribute(.font, value: font ?? UIFont(), range: textRange)
		attributedString.addAttribute(.foregroundColor, value: color ?? UIColor(), range: textRange)

		return attributedString
	}
    
    /// Transforms the string into a bullet list indented.
    ///
    /// Use this when you need to split your string in a list of string items with bullets and indentation.
    /// Be sure that your string has .isNewLine separator (ie. “\n” - "\r” - “\r\n”)  on it, since this is
    /// used to get the new lines from the string.
    /// ```
    /// let myString = "A\nB\nC\nD"
    /// print(myString.asBulletItems(UIFont, UIColor))
    /// // Prints:
    /// • A
    /// • B
    /// • C
    /// • D
    /// ```
    ///
    /// - Parameter font: (required) UIFont for resulting NSAttributedString
    /// - Parameter textColor: (required) UIColor used for text and bullets
    /// - Parameter bullet: String used for separator, default: "\u{2022}"
    /// - Parameter indentation: CGFloat value for left indent, default: 8
    /// - Parameter lineSpacing: CGFloat value for space between lines, default: 2
    /// - Parameter paragraphSpacing: CGFloat value for space between paragraphs, default: 2
    ///
    /// - Returns: NSAttributedString with line breaks, bullets and indentation.
    func asBulletItems(font: UIFont, textColor: UIColor, bullet: String = "\u{2022}",
                       indentation: CGFloat = 8, lineSpacing: CGFloat = 2, paragraphSpacing: CGFloat = 2) -> NSAttributedString {

        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]

        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation

        let bulletList = NSMutableAttributedString()
        let stringElements = self.split(whereSeparator: \.isNewline)
        for (idx, string) in stringElements.enumerated() {
            let formattedString = "\(bullet)\t\(string)" + ((stringElements.endIndex - 1 == idx) ? "" : "\n")
            let attributedString = NSMutableAttributedString(string: formattedString)

            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))

            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))

            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }
        
        return bulletList
    }
}


extension NSMutableAttributedString {

	public func add(toText: String, font: UIFont?, color: UIColor?, underline: Bool = false) {

		var location = 0

		if let stringRange = self.string.range(of: toText), self.string.contains(toText) {
			location = stringRange.lowerBound.utf16Offset(in: self.string)
		}

		let toTextRange = NSRange(location: location, length: toText.count)

		self.addAttribute(.font, value: font ?? UIFont(), range: toTextRange)
		self.addAttribute(.foregroundColor, value: color ?? UIColor(), range: toTextRange)

		if underline {
			self.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: toTextRange)
		}
	}
}
