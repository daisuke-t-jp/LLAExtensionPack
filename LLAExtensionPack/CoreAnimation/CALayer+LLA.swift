//
//  CALayer+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import QuartzCore



extension CALayer: LLANamespaceWrapper {}
public extension LLATypeWrapper where T == CALayer
{
	public func sublayerWithName(_ name: String) -> CALayer?
	{
		for elm in SELF.sublayers ?? []
		{
			if elm.name == name
			{
				return elm
			}
		}

		return nil
	}
}

