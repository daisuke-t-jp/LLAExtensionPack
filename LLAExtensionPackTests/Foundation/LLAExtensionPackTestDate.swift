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

		XCTAssertGreaterThan(date.LLA.unixTime(), 0)
		XCTAssertEqual(date.LLA.year(), 1999)
		XCTAssertEqual(date.LLA.month(), 2)
		XCTAssertEqual(date.LLA.day(), 1)
		XCTAssertEqual(date.LLA.hour(), 12)
		XCTAssertEqual(date.LLA.minute(), 30)
		XCTAssertEqual(date.LLA.second(), 50)
		XCTAssertEqual(date.LLA.millisecond(), 123)
		XCTAssertGreaterThanOrEqual(date.LLA.microsecond()!, 123000)
		XCTAssertGreaterThanOrEqual(date.LLA.nanosecond()!, 123000000)
	}

	func testInspect() {
		let dateFormater = DateFormatter()
		dateFormater.locale = Locale(identifier: "en_US")
		dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
		let date = dateFormater.date(from: "1999/2/1 12:30:50.123")!
		let dateLeapYear = dateFormater.date(from: "2000/2/1 12:30:50.123")!

		XCTAssertTrue(dateLeapYear.LLA.isLeapYear())
		XCTAssertFalse(date.LLA.isLeapYear())
	}
	
	func testTransform() {
		let dateFormater = DateFormatter()
		dateFormater.locale = Locale(identifier: "en_US")
		dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
		let date = dateFormater.date(from: "1999/1/1 12:30:50.123")!
		let date2 = dateFormater.date(from: "1999/12/31 12:30:50.123")!
		let dateLeapYear = dateFormater.date(from: "2000/2/1 12:30:50.123")!

		XCTAssertEqual(date.LLA.lastMonth()!.LLA.year(), 1998)
		XCTAssertEqual(date.LLA.lastMonth()!.LLA.month(), 12)
		XCTAssertEqual(date2.LLA.nextMonth()!.LLA.year(), 2000)
		XCTAssertEqual(date2.LLA.nextMonth()!.LLA.month(), 1)

		XCTAssertEqual(date.LLA.yesterday()!.LLA.year(), 1998)
		XCTAssertEqual(date.LLA.yesterday()!.LLA.month(), 12)
		XCTAssertEqual(date.LLA.yesterday()!.LLA.day(), 31)

		XCTAssertEqual(date2.LLA.tommorow()!.LLA.year(), 2000)
		XCTAssertEqual(date2.LLA.tommorow()!.LLA.month(), 1)
		XCTAssertEqual(date2.LLA.tommorow()!.LLA.day(), 1)

		XCTAssertEqual(date.LLA.startOfDay()!.LLA.hour(), 0)
		XCTAssertEqual(date.LLA.startOfDay()!.LLA.minute(), 0)
		XCTAssertEqual(date.LLA.startOfDay()!.LLA.second(), 0)
		XCTAssertEqual(date.LLA.startOfDay()!.LLA.millisecond(), 0)
		XCTAssertEqual(date.LLA.startOfDay()!.LLA.microsecond(), 0)
		XCTAssertEqual(date.LLA.startOfDay()!.LLA.nanosecond(), 0)

		XCTAssertEqual(date.LLA.endOfDay()!.LLA.hour(), 23)
		XCTAssertEqual(date.LLA.endOfDay()!.LLA.minute(), 59)
		XCTAssertEqual(date.LLA.endOfDay()!.LLA.second(), 59)
		XCTAssertEqual(date.LLA.endOfDay()!.LLA.millisecond(), 0)
		XCTAssertEqual(date.LLA.endOfDay()!.LLA.microsecond(), 0)
		XCTAssertEqual(date.LLA.endOfDay()!.LLA.nanosecond(), 0)

		XCTAssertEqual(date2.LLA.firstDayOfMonth()!.LLA.month(), 12)
		XCTAssertEqual(date2.LLA.firstDayOfMonth()!.LLA.day(), 1)
		XCTAssertEqual(date.LLA.endDayOfMonth()!.LLA.month(), 1)
		XCTAssertEqual(date.LLA.endDayOfMonth()!.LLA.day(), 31)

		XCTAssertEqual(date.LLA.daysOfMonth(), 31)
		XCTAssertEqual(dateLeapYear.LLA.daysOfMonth(), 29)
	}

}
