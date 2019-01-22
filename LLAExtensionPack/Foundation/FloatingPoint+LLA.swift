//
//  FloatingPoint+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/22.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



// MARK: WITHOUT-NAMESPACE
public extension FloatingPoint
{
	public var string: String
	{
		return String(format: "%f", self as! CVarArg)
	}
	
	public var radian: Self
	{
		return self * .pi / 180
	}
	
	public var degree: Self
	{
		return self * 180 / .pi
	}
}