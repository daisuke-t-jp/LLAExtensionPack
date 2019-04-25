//
//  LLAExtensionPackTestDate.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestDate: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testCompoents() {
    let dateFormater = DateFormatter()
    dateFormater.locale = Locale(identifier: "en_US")
    dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
    let date = dateFormater.date(from: "1999/2/1 12:30:50.123")!

    XCTAssertGreaterThan(date.unixTime, 0)
    XCTAssertEqual(date.year, 1999)
    XCTAssertEqual(date.month, 2)
    XCTAssertEqual(date.day, 1)
    XCTAssertEqual(date.hour, 12)
    XCTAssertEqual(date.minute, 30)
    XCTAssertEqual(date.second, 50)
    XCTAssertEqual(date.millisecond, 123)
    XCTAssertGreaterThanOrEqual(date.microsecond!, 123000)
    XCTAssertGreaterThanOrEqual(date.nanosecond!, 123000000)
  }

  func testInspect() {
    let dateFormater = DateFormatter()
    dateFormater.locale = Locale(identifier: "en_US")
    dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
    let date = dateFormater.date(from: "1999/2/1 12:30:50.123")!
    let dateLeapYear = dateFormater.date(from: "2000/2/1 12:30:50.123")!

    XCTAssertTrue(dateLeapYear.isLeapYear)
    XCTAssertFalse(date.isLeapYear)
  }
  
  func testTransform() {
    let dateFormater = DateFormatter()
    dateFormater.locale = Locale(identifier: "en_US")
    dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
    let date = dateFormater.date(from: "1999/1/1 12:30:50.123")!
    let date2 = dateFormater.date(from: "1999/12/31 12:30:50.123")!
    let dateLeapYear = dateFormater.date(from: "2000/2/1 12:30:50.123")!

    XCTAssertEqual(date.lastMonth!.year, 1998)
    XCTAssertEqual(date.lastMonth!.month, 12)
    XCTAssertEqual(date2.nextMonth!.year, 2000)
    XCTAssertEqual(date2.nextMonth!.month, 1)

    XCTAssertEqual(date.yesterday!.year, 1998)
    XCTAssertEqual(date.yesterday!.month, 12)
    XCTAssertEqual(date.yesterday!.day, 31)

    XCTAssertEqual(date2.tommorow!.year, 2000)
    XCTAssertEqual(date2.tommorow!.month, 1)
    XCTAssertEqual(date2.tommorow!.day, 1)

    XCTAssertEqual(date.startOfDay!.hour, 0)
    XCTAssertEqual(date.startOfDay!.minute, 0)
    XCTAssertEqual(date.startOfDay!.second, 0)
    XCTAssertEqual(date.startOfDay!.millisecond, 0)
    XCTAssertEqual(date.startOfDay!.microsecond, 0)
    XCTAssertEqual(date.startOfDay!.nanosecond, 0)

    XCTAssertEqual(date.endOfDay!.hour, 23)
    XCTAssertEqual(date.endOfDay!.minute, 59)
    XCTAssertEqual(date.endOfDay!.second, 59)
    XCTAssertEqual(date.endOfDay!.millisecond, 0)
    XCTAssertEqual(date.endOfDay!.microsecond, 0)
    XCTAssertEqual(date.endOfDay!.nanosecond, 0)

    XCTAssertEqual(date2.firstDayOfMonth!.month, 12)
    XCTAssertEqual(date2.firstDayOfMonth!.day, 1)
    XCTAssertEqual(date.endDayOfMonth!.month, 1)
    XCTAssertEqual(date.endDayOfMonth!.day, 31)

    XCTAssertEqual(date.daysOfMonth, 31)
    XCTAssertEqual(dateLeapYear.daysOfMonth, 29)
  }

}
