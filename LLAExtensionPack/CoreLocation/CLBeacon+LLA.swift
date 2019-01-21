//
//  CLBeacon+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/21.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import CoreLocation



extension CLBeacon: LLANamespaceWrapper {}

// MARK: Property
public extension LLATypeWrapper where T == CLBeacon
{
	public func proximityUUIDString() -> String
	{
		return SELF.proximityUUID.LLA.string()
	}

	public func majorString() -> String
	{
		return SELF.major.stringValue
	}

	public func minorString() -> String
	{
		return SELF.minor.stringValue
	}
}
