//
//  CGFloat+Format.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 12/02/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension CGFloat {
	func formatTwoDecimal() -> String {
		return String(format: "%.2f", self)
	}
}
