//
//  Int+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/17.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



// MARK: - Format
public extension Int {

	private func formatString(_ style: NumberFormatter.Style,
							  locale: Locale.LocaleIdentifier) -> String? {
		let formatter = NumberFormatter()
		formatter.numberStyle = style
		formatter.locale = Locale(identifier: locale.rawValue)
		return formatter.string(from: self as NSNumber)
	}
	
	public func decimalFormatString(_ locale: Locale.LocaleIdentifier) -> String? {
		return formatString(.decimal, locale: locale)
	}

	public func currencyFormatString(_ locale: Locale.LocaleIdentifier) -> String? {
		return formatString(.currency, locale: locale)
	}
	
	public func kiloFormatString(_ locale: Locale.LocaleIdentifier) -> String? {
		if(self >= 1000) {
			// more than kilo.
			let k = self / 1000
			let v = (self - (k * 1000)) / 100

			guard let str = k.decimalFormatString(locale) else {
				return nil
			}

			if(v == 0) {
				// only kilo.
				return str
			}

			return "\(str).\(v)"
		}

		// less than kilo.
		return self.decimalFormatString(locale)
	}
}
