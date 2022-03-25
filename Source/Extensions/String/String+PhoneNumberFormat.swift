//
//  String+PhoneNumberFormat.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 30/03/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension String {

	public func formatPhoneNumber() -> String {
		let makeRange = NSRange(location: 2, length: (self.count-2))
		guard let range = Range(makeRange, in: self) else {
			return self
		}

		let phoneSubString = self[range]
		return String(phoneSubString)
	}
}
