//
//  LLAExtensionPackTestFloatingPoint.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2019/01/22.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestFloatingPoint: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func test() {
		XCTAssertEqual(123.456.string[...6], "123.456")
		XCTAssertEqual(180.radian.string[...3], "3.14")
		XCTAssertEqual(3.14.degree.rounded().string[...2], "180")
	}
}
