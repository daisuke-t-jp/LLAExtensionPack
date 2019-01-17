//
//  LLAExtensionPack.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/17.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation

public class LLAExtensionPack
{
	public static func clamp<T: Comparable>(_ val: T, min: T, max: T) -> T
	{
		if val < min
		{
			return min
		}

		if val > max
		{
			return max
		}

		return val
	}

}
