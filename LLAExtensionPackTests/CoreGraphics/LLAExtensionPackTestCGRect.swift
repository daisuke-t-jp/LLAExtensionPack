//
//  LLAExtensionPackTestCGRect.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestCGRect: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func test() {
		var rect = CGRect(x: 10, y: 20, width: 30, height: 40)

		XCTAssertEqual(rect.x(), 10)
		XCTAssertEqual(rect.y(), 20)
		XCTAssertEqual(rect.width(), 30)
		XCTAssertEqual(rect.height(), 40)
		
		
		rect.setX(100)
		rect.setY(200)
		rect.setWidth(300)
		rect.setHeight(400)
		
		XCTAssertEqual(rect.x(), 100)
		XCTAssertEqual(rect.y(), 200)
		XCTAssertEqual(rect.width(), 300)
		XCTAssertEqual(rect.height(), 400)
	}
}
