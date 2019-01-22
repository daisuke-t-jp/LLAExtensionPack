//
//  LLAExtensionPackTestBynaryInteger.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/01/22.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestBynaryInteger: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test() {
		XCTAssertEqual(180.radianDouble.string[...3], "3.14")
		XCTAssertEqual(180.radianFloat.string[...3], "3.14")
		XCTAssertEqual(180.radianCGFloat.string[...3], "3.14")
	}
}

