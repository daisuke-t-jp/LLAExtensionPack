//
//  CLBeacon+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/21.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import CoreLocation



// MARK: - Property
public extension CLBeacon {

  var proximityUUIDString: String {
    return proximityUUID.string
  }

  var majorString: String {
    return major.stringValue
  }

  var minorString: String {
    return minor.stringValue
  }
}
