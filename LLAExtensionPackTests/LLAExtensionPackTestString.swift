//
//  LLAExtensionPackTestString.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestString: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCompare() {

		XCTAssertTrue("string".LLA.isEqual("string"))
		XCTAssertFalse("string".LLA.isEqual("String"))
		XCTAssertTrue("string".LLA.isEqual("string", caseInsensitive: true))
		XCTAssertTrue("string".LLA.isEqual("String", caseInsensitive: true))

	}

	func testFind() {
		
		XCTAssertTrue("string".LLA.hasPrefix("str"))
		XCTAssertFalse("string".LLA.hasPrefix("Str"))
		XCTAssertTrue("string".LLA.hasPrefix("str", caseInsensitive: true))
		XCTAssertTrue("string".LLA.hasPrefix("Str", caseInsensitive: true))

		XCTAssertTrue("string".LLA.hasSuffix("ing"))
		XCTAssertFalse("string".LLA.hasSuffix("Ing"))
		XCTAssertTrue("string".LLA.hasSuffix("ing", caseInsensitive: true))
		XCTAssertTrue("string".LLA.hasSuffix("Ing", caseInsensitive: true))

		XCTAssertTrue("string".LLA.contains("tri"))
		XCTAssertFalse("string".LLA.contains("Tri"))
		XCTAssertTrue("string".LLA.contains("tri", caseInsensitive: true))
		XCTAssertTrue("string".LLA.contains("Tri", caseInsensitive: true))

	}

	func testInspect() {
		XCTAssertTrue("1".LLA.isNumeric())
		XCTAssertTrue("123".LLA.isNumeric())
		XCTAssertFalse("A".LLA.isNumeric())
		XCTAssertFalse("1A3".LLA.isNumeric())
	}
	
	func testReplace() {
		XCTAssertEqual("string".LLA.replace("str", replacement: "STR"), "STRing")
		XCTAssertEqual("string".LLA.replace("string", replacement: ""), "")
		XCTAssertEqual("string".LLA.replace("", replacement: "STR"), "string")
		XCTAssertEqual("string".LLA.replace("Str", replacement: "STR"), "string")
		XCTAssertEqual("string".LLA.replace("STR", replacement: "", caseInsensitive: true), "ing")
	}

	func testRemove() {
		XCTAssertEqual("string".LLA.remove("str"), "ing")
		XCTAssertEqual("string".LLA.remove("string"), "")
		XCTAssertEqual("string".LLA.remove(""), "string")
		XCTAssertEqual("string".LLA.remove("Str"), "string")
		XCTAssertEqual("string".LLA.remove("STR", caseInsensitive: true), "ing")
	}
	
	func testEncode() {
		XCTAssertEqual("abcABC1234/?-._~".LLA.urlEncoding, "abcABC1234/?-._~")
		XCTAssertEqual(":#[]@!$&'()*+,;=".LLA.urlEncoding, "%3A%23%5B%5D%40%21%24%26%27%28%29%2A%2B%2C%3B%3D")
	}

}
