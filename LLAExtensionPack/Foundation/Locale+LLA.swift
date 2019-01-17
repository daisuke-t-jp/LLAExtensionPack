//
//  Locale+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/17.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation


extension Locale: LLANamespaceWrapper {}

// MARK: Enum, Const
public extension LLATypeWrapper where T == Locale
{
	public enum LocaleIdentifier: String
	{
		case en_US = "en_US"
		case ja_JP = "ja_JP"
	}
}




