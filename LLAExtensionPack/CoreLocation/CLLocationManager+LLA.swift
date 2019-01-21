//
//  CLLocationManager+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/21.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import CoreLocation



extension CLLocationManager: LLANamespaceWrapper {}

// MARK: Utility
public extension LLATypeWrapper where T == CLLocationManager
{
	static public let authorizationStatusStringMap: [CLAuthorizationStatus: String] = [
		.notDetermined: "notDetermined",
		.restricted: "restricted",
		.denied: "denied",
		.authorizedAlways: "authorizedAlways",
		.authorizedWhenInUse: "authorizedWhenInUse"]

	static public func authorizationStatus2String(_ status: CLAuthorizationStatus) -> String?
	{
		return authorizationStatusStringMap[status]
	}

	public func authorizationStatusString() -> String?
	{
		return CLLocationManager.LLA.authorizationStatus2String(CLLocationManager.authorizationStatus())
	}
}



// MARK: Request
public extension LLATypeWrapper where T == CLLocationManager
{
	public func requestWhenInUse() -> Void
	{
		SELF.requestWhenInUseAuthorization()
		SELF.allowsBackgroundLocationUpdates = false
		SELF.pausesLocationUpdatesAutomatically = false
	}

	public func requestAlways(_ allowBackgroundUpdate: Bool) -> Void
	{
		SELF.requestAlwaysAuthorization()
		SELF.allowsBackgroundLocationUpdates = allowBackgroundUpdate
	}
}



// MARK: Auth status
public extension LLATypeWrapper where T == CLLocationManager
{
	static public func isAuthorizationStatusWhenInUseOrAlways() -> Bool
	{
		return isAuthorizationStatusWhenInUseOrAlways(CLLocationManager.authorizationStatus())
	}

	static public func isAuthorizationStatusWhenInUseOrAlways(_ status: CLAuthorizationStatus) -> Bool
	{
		if status == .authorizedWhenInUse
		{
			return true
		}
		else if status == .authorizedAlways
		{
			return true
		}
		
		return false
	}
}
