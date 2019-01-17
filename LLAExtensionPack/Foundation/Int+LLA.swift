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
}
