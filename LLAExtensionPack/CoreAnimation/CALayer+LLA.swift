//
//  CALayer+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import QuartzCore



public extension CALayer
{
	public func sublayerWithName(_ name: String) -> CALayer?
	{
		for elm in sublayers ?? []
		{
			if elm.name == name
			{
				return elm
			}
		}

		return nil
	}
}

