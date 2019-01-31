//
//  LLAExtensionPackTestBudle.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestBundle: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func test() {
		let bundle = Bundle(for: type(of: self))

		XCTAssertNotNil(bundle.shortVersion)
		XCTAssertNotNil(bundle.version)
		XCTAssertNotNil(bundle.identifier)
	}

}
