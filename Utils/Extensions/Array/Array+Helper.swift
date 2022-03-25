//
//  Array+Helper.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 6/02/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

extension Array {
	public func isLastItem(_ index: Int) -> Bool {
		return (index + 1) == self.count
	}
}

extension Sequence where Iterator.Element: Hashable {
	func unique() -> [Iterator.Element] {
		var seen: Set<Iterator.Element> = []
		return filter { seen.insert($0).inserted }
	}
}
