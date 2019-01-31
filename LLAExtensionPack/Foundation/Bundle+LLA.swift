//
//  Bundle+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



public extension Bundle
{
	public var shortVersion: String?
	{
		guard let dict = infoDictionary else
		{
			return nil
		}
		
		return dict["CFBundleShortVersionString"] as? String
	}

	public var version: String?
	{
		guard let dict = infoDictionary else
		{
			return nil
		}
		
		return dict["CFBundleVersion"] as? String
	}
	
	public var identifier: String
	{
		return bundleIdentifier!
	}
}
