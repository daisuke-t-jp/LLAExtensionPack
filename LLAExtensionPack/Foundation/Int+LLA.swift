//
//  Int+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/17.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



extension Int: LLANamespaceWrapper {}

// MARK: Format
public extension LLATypeWrapper where T == Int
{
	private func formatString(_ style: NumberFormatter.Style,
							  locale: LLATypeWrapper<Locale>.LocaleIdentifier) -> String?
	{
		let formatter = NumberFormatter()
		formatter.numberStyle = style
		formatter.locale = Locale(identifier: locale.rawValue)
		return formatter.string(from: SELF as NSNumber)
	}
	
	public func decimalFormatString(_ locale: LLATypeWrapper<Locale>.LocaleIdentifier) -> String?
	{
		return formatString(.decimal, locale: locale)
	}

	public func currencyFormatString(_ locale: LLATypeWrapper<Locale>.LocaleIdentifier) -> String?
	{
		return formatString(.currency, locale: locale)
	}
	
	public func kiloFormatString(_ locale: LLATypeWrapper<Locale>.LocaleIdentifier) -> String?
	{
		if(SELF >= 1000){
			// more than kilo.
			let k = SELF / 1000
			let v = (SELF - (k * 1000)) / 100

			guard let str = k.LLA.decimalFormatString(locale) else {
				return nil
			}

			if(v == 0) {
				// only kilo.
				return str
			}

			return "\(str).\(v)"
		}

		// less than kilo.
		return SELF.LLA.decimalFormatString(locale)
	}
}
