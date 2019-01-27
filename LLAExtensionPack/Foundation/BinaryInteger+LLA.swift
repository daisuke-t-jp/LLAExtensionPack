//
//  BinaryInteger+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/22.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



public extension BinaryInteger
{
	public var radianDouble: Double
	{
		return Double(self) * .pi / 180
	}

	public var radianFloat: Float
	{
		return Float(self) * .pi / 180
	}

	public var radianCGFloat: CGFloat
	{
		return CGFloat(self) * .pi / 180
	}
}
