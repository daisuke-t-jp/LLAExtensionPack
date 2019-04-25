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

  public var proximityUUIDString: String {
    return proximityUUID.string
  }

  public var majorString: String {
    return major.stringValue
  }

  public var minorString: String {
    return minor.stringValue
  }
}
