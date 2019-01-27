//
//  UIDevice+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



public extension UIDevice
{
	static private func systemVersionComponents() -> [String]?
	{
		let ver = UIDevice.current.systemVersion
		let array = ver.components(separatedBy: ".")
		guard array.count >= 2 else
		{
			return nil
		}
		
		return array
	}

	static public func systemVersionMajor() -> Int?
	{
		guard let array = systemVersionComponents() else
		{
			return nil
		}

		return Int(array[0])
	}

	static public func systemVersionMinor() -> Int?
	{
		guard let array = systemVersionComponents() else
		{
			return nil
		}
		
		return Int(array[1])
	}
}
