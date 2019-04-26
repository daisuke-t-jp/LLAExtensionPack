//
//  LLAExtensionPackTestCLLocationManager.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2019/01/21.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest
import CoreLocation

@testable import LLAExtensionPack



class LLAExtensionPackTestCLLocationManager: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func test() {
    XCTAssertEqual(CLLocationManager.authorizationStatus2String(.notDetermined), "notDetermined")
    XCTAssertEqual(CLLocationManager.authorizationStatus2String(.restricted), "restricted")
    XCTAssertEqual(CLLocationManager.authorizationStatus2String(.denied), "denied")
    XCTAssertEqual(CLLocationManager.authorizationStatus2String(.authorizedAlways), "authorizedAlways")
    XCTAssertEqual(CLLocationManager.authorizationStatus2String(.authorizedWhenInUse), "authorizedWhenInUse")
    
    XCTAssertFalse(CLLocationManager.isAuthorizationStatusWhenInUseOrAlways(.notDetermined))
    XCTAssertFalse(CLLocationManager.isAuthorizationStatusWhenInUseOrAlways(.restricted))
    XCTAssertFalse(CLLocationManager.isAuthorizationStatusWhenInUseOrAlways(.denied))
    XCTAssertTrue(CLLocationManager.isAuthorizationStatusWhenInUseOrAlways(.authorizedAlways))
    XCTAssertTrue(CLLocationManager.isAuthorizationStatusWhenInUseOrAlways(.authorizedWhenInUse))
  }
  
}
