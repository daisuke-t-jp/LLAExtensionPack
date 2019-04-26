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
  
  static let authorizationStatusStringMap: [CLAuthorizationStatus: String] = [
    .notDetermined: "notDetermined",
    .restricted: "restricted",
    .denied: "denied",
    .authorizedAlways: "authorizedAlways",
    .authorizedWhenInUse: "authorizedWhenInUse"]
  
  static func authorizationStatus2String(_ status: CLAuthorizationStatus) -> String? {
    return authorizationStatusStringMap[status]
  }
  
  func authorizationStatusString() -> String? {
    return CLLocationManager.authorizationStatus2String(CLLocationManager.authorizationStatus())
  }
}



// MARK: - Request
public extension CLLocationManager {
  func requestWhenInUse() {
    requestWhenInUseAuthorization()
    allowsBackgroundLocationUpdates = false
    pausesLocationUpdatesAutomatically = false
  }
  
  func requestAlways(_ allowBackgroundUpdate: Bool) {
    requestAlwaysAuthorization()
    allowsBackgroundLocationUpdates = allowBackgroundUpdate
  }
}



// MARK: - Auth status
public extension CLLocationManager {
  static func isAuthorizationStatusWhenInUseOrAlways() -> Bool {
    return isAuthorizationStatusWhenInUseOrAlways(CLLocationManager.authorizationStatus())
  }
  
  static func isAuthorizationStatusWhenInUseOrAlways(_ status: CLAuthorizationStatus) -> Bool {
    if status == .authorizedWhenInUse {
      return true
    } else if status == .authorizedAlways {
      return true
    }
    
    return false
  }
}
