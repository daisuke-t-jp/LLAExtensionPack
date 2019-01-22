//
//  LLAExtensionPackTestURL.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestURL: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func test() {

		let url = URL(string: "https://www.example.com/api?")!
		XCTAssertTrue(url.LLA.queryMap().keys.isEmpty)

		let url2 = URL(string: "https://www.example.com/api?color=white&time=morning&gender=female")!
		XCTAssertEqual(url2.LLA.queryMap()["color"], "white")
		XCTAssertEqual(url2.LLA.queryMap()["time"], "morning")
		XCTAssertEqual(url2.LLA.queryMap()["gender"], "female")
		
	}

}
