//
//  UUID+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/17.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



extension UUID: LLANamespaceWrapper {}

public extension LLATypeWrapper where T == UUID
{
	static public func string() -> String
	{
		return UUID().uuidString
	}

	public func string() -> String
	{
		return SELF.uuidString
	}
}
