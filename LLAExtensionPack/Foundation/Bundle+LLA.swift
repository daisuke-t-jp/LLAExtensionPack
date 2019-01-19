//
//  Bundle+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



extension Bundle: LLANamespaceWrapper {}
public extension LLATypeWrapper where T == Bundle
{
	public func shortVersion() -> String?
	{
		guard let dict = SELF.infoDictionary else
		{
			return nil
		}
		
		return dict["CFBundleShortVersionString"] as? String
	}

	public func version() -> String?
	{
		guard let dict = SELF.infoDictionary else
		{
			return nil
		}
		
		return dict["CFBundleVersion"] as? String
	}
	
	public func identifier() -> String
	{
		return SELF.bundleIdentifier!
	}
}
