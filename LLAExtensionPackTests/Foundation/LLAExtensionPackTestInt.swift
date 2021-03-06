//
//  LLAExtensionPackTestInt.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestInt: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func test() {
    XCTAssertEqual(1234.decimalFormatString(Locale.LocaleIdentifier.enUS), "1,234")
    XCTAssertEqual(1234.decimalFormatString(Locale.LocaleIdentifier.jaJP), "1,234")
    
    XCTAssertEqual(1234.currencyFormatString(Locale.LocaleIdentifier.enUS), "$1,234.00")
    XCTAssertEqual(1234.currencyFormatString(Locale.LocaleIdentifier.jaJP), "¥1,234")
    
    XCTAssertEqual(123.kiloFormatString(Locale.LocaleIdentifier.enUS)! + "m", "123m")
    XCTAssertEqual(1234.kiloFormatString(Locale.LocaleIdentifier.enUS)! + "km", "1.2km")
    XCTAssertEqual(12345.kiloFormatString(Locale.LocaleIdentifier.enUS)! + "km", "12.3km")
  }
}
