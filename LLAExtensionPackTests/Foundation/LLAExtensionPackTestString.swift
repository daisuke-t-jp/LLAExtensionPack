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
		XCTAssertTrue("string".isEqual("string"))
		XCTAssertFalse("string".isEqual("String"))
		XCTAssertTrue("string".isEqual("String", caseInsensitive: true))
	}

	func testFind() {
		XCTAssertTrue("string".hasPrefix("str"))
		XCTAssertFalse("string".hasPrefix("Str"))
		XCTAssertTrue("string".hasPrefix("Str", caseInsensitive: true))

		XCTAssertTrue("string".hasSuffix("ing"))
		XCTAssertFalse("string".hasSuffix("Ing"))
		XCTAssertTrue("string".hasSuffix("Ing", caseInsensitive: true))

		XCTAssertTrue("string".contains("tri"))
		XCTAssertFalse("string".contains("Tri"))
		XCTAssertTrue("string".contains("Tri", caseInsensitive: true))

		XCTAssertNotNil("string".range("str"))
		XCTAssertNil("string".range("Str"))
		XCTAssertNotNil("string".range("Str", caseInsensitive: true))
	}

	func testSubstring() {
		let str = "string"
		
		XCTAssertEqual(str[str.startIndex(0)!...], "string")
		XCTAssertEqual(str[str.startIndex(0)!..<str.startIndex(2)!], "st")
		XCTAssertEqual(str[str.startIndex(0)!...str.startIndex(2)!], "str")
		XCTAssertEqual(str[...str.startIndex(str.count - 1)!], "string")
		XCTAssertEqual(str[..<str.startIndex(str.count)!], "string")

		XCTAssertEqual(str[...str.endIndex(-1)!], "string")
		XCTAssertEqual(str[str.endIndex(-3)!..<str.endIndex(-1)!], "in")
		XCTAssertEqual(str[str.endIndex(-3)!...str.endIndex(-1)!], "ing")
		XCTAssertEqual(str[str.endIndex(-6)!...], "string")

		XCTAssertEqual(str.substring(1, end: 3), "tri")
		XCTAssertEqual(str.substring(NSMakeRange(1, 3)), "tri")
		XCTAssertEqual(str.substringFromIndex(1), "tring")
		XCTAssertEqual(str.substringToIndex(3), "str")
	}
	
	func testSubscript() {
		let str = "string"
		
		XCTAssertEqual(str[0..<2], "st")
		XCTAssertEqual(str[0...2], "str")
		
		XCTAssertEqual(str[1..<3], "tr")
		XCTAssertEqual(str[1...3], "tri")

		XCTAssertEqual(str[1...], "tring")
		XCTAssertEqual(str[...2], "str")
	}

	func testInspect() {
		XCTAssertTrue("1".isNumeric)
		XCTAssertTrue("123".isNumeric)
		XCTAssertFalse("A".isNumeric)
		XCTAssertFalse("1A3".isNumeric)
	}
	
	func testReplace() {
		XCTAssertEqual("string".replace("str", replacement: "STR"), "STRing")
		XCTAssertEqual("string".replace("string", replacement: ""), "")
		XCTAssertEqual("string".replace("", replacement: "STR"), "string")
		XCTAssertEqual("string".replace("Str", replacement: "STR"), "string")
		XCTAssertEqual("string".replace("STR", replacement: "", caseInsensitive: true), "ing")
	}

	func testRemove() {
		XCTAssertEqual("string".remove("str"), "ing")
		XCTAssertEqual("string".remove("string"), "")
		XCTAssertEqual("string".remove(""), "string")
		XCTAssertEqual("string".remove("Str"), "string")
		XCTAssertEqual("string".remove("STR", caseInsensitive: true), "ing")
	}
	
	func testEncode() {
		XCTAssertEqual("abcABC1234/?-._~".urlEncoding, "abcABC1234/?-._~")
		XCTAssertEqual(":#[]@!$&'()*+,;=".urlEncoding, "%3A%23%5B%5D%40%21%24%26%27%28%29%2A%2B%2C%3B%3D")
	}

	func testHash() {
		XCTAssertEqual("MD5".hashMD5!.count, 32)
		XCTAssertEqual("SHA1".hashSHA1!.count, 40)
	}

	func testTransform() {
		XCTAssertEqual("ＳＴＲＩＮＧ".fullWidth, "ＳＴＲＩＮＧ")
		XCTAssertEqual("ＳＴＲＩＮＧ".halfWidth, "STRING")

		XCTAssertEqual("STRING".fullWidth, "ＳＴＲＩＮＧ")
		XCTAssertEqual("STRING".halfWidth, "STRING")

		XCTAssertEqual("ことえり".hiragana, "ことえり")
		XCTAssertEqual("ことえり".katakana, "コトエリ")

		XCTAssertEqual("コトエリ".hiragana, "ことえり")
		XCTAssertEqual("コトエリ".katakana, "コトエリ")
	}	
}
