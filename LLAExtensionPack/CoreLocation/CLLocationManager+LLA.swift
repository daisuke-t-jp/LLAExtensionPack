//
//  CLLocationManager+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/21.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import CoreLocation



// MARK: - Utility
public extension CLLocationManager {

	static public let authorizationStatusStringMap: [CLAuthorizationStatus: String] = [
		.notDetermined: "notDetermined",
		.restricted: "restricted",
		.denied: "denied",
		.authorizedAlways: "authorizedAlways",
		.authorizedWhenInUse: "authorizedWhenInUse"]

	static public func authorizationStatus2String(_ status: CLAuthorizationStatus) -> String? {
		return authorizationStatusStringMap[status]
	}

	public func authorizationStatusString() -> String? {
		return CLLocationManager.authorizationStatus2String(CLLocationManager.authorizationStatus())
	}
}



// MARK: - Request
public extension CLLocationManager {
	public func requestWhenInUse() {
		requestWhenInUseAuthorization()
		allowsBackgroundLocationUpdates = false
		pausesLocationUpdatesAutomatically = false
	}

	public func requestAlways(_ allowBackgroundUpdate: Bool) {
		requestAlwaysAuthorization()
		allowsBackgroundLocationUpdates = allowBackgroundUpdate
	}
}



// MARK: - Auth status
public extension CLLocationManager {
	static public func isAuthorizationStatusWhenInUseOrAlways() -> Bool {
		return isAuthorizationStatusWhenInUseOrAlways(CLLocationManager.authorizationStatus())
	}

	static public func isAuthorizationStatusWhenInUseOrAlways(_ status: CLAuthorizationStatus) -> Bool {
		if status == .authorizedWhenInUse {
			return true
		} else if status == .authorizedAlways {
			return true
		}
		
		return false
	}
}
