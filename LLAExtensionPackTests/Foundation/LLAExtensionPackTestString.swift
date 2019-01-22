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
		XCTAssertTrue("string".LLA.isEqual("String", caseInsensitive: true))
	}

	func testFind() {
		XCTAssertTrue("string".LLA.hasPrefix("str"))
		XCTAssertFalse("string".LLA.hasPrefix("Str"))
		XCTAssertTrue("string".LLA.hasPrefix("Str", caseInsensitive: true))

		XCTAssertTrue("string".LLA.hasSuffix("ing"))
		XCTAssertFalse("string".LLA.hasSuffix("Ing"))
		XCTAssertTrue("string".LLA.hasSuffix("Ing", caseInsensitive: true))

		XCTAssertTrue("string".LLA.contains("tri"))
		XCTAssertFalse("string".LLA.contains("Tri"))
		XCTAssertTrue("string".LLA.contains("Tri", caseInsensitive: true))

		XCTAssertNotNil("string".LLA.range("str"))
		XCTAssertNil("string".LLA.range("Str"))
		XCTAssertNotNil("string".LLA.range("Str", caseInsensitive: true))
	}

	func testSubstring() {
		let str = "string"
		
		XCTAssertEqual(str[str.LLA.startIndex(0)!...], "string")
		XCTAssertEqual(str[str.LLA.startIndex(0)!..<str.LLA.startIndex(2)!], "st")
		XCTAssertEqual(str[str.LLA.startIndex(0)!...str.LLA.startIndex(2)!], "str")
		XCTAssertEqual(str[...str.LLA.startIndex(str.count - 1)!], "string")
		XCTAssertEqual(str[..<str.LLA.startIndex(str.count)!], "string")

		XCTAssertEqual(str[...str.LLA.endIndex(-1)!], "string")
		XCTAssertEqual(str[str.LLA.endIndex(-3)!..<str.LLA.endIndex(-1)!], "in")
		XCTAssertEqual(str[str.LLA.endIndex(-3)!...str.LLA.endIndex(-1)!], "ing")
		XCTAssertEqual(str[str.LLA.endIndex(-6)!...], "string")

		XCTAssertEqual(str.LLA.substring(1, end: 3), "tri")
		XCTAssertEqual(str.LLA.substring(NSMakeRange(1, 3)), "tri")
		XCTAssertEqual(str.LLA.substringFromIndex(1), "tring")
		XCTAssertEqual(str.LLA.substringToIndex(3), "str")
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
		XCTAssertEqual("abcABC1234/?-._~".LLA.urlEncoding(), "abcABC1234/?-._~")
		XCTAssertEqual(":#[]@!$&'()*+,;=".LLA.urlEncoding(), "%3A%23%5B%5D%40%21%24%26%27%28%29%2A%2B%2C%3B%3D")
	}

	func testHash() {
		XCTAssertEqual("MD5".LLA.hashMD5()!.count, 32)
		XCTAssertEqual("SHA1".LLA.hashSHA1()!.count, 40)
	}

	func testTransform() {
		XCTAssertEqual("ＳＴＲＩＮＧ".LLA.fullWidth(), "ＳＴＲＩＮＧ")
		XCTAssertEqual("ＳＴＲＩＮＧ".LLA.halfWidth(), "STRING")

		XCTAssertEqual("STRING".LLA.fullWidth(), "ＳＴＲＩＮＧ")
		XCTAssertEqual("STRING".LLA.halfWidth(), "STRING")

		XCTAssertEqual("ことえり".LLA.hiragana(), "ことえり")
		XCTAssertEqual("ことえり".LLA.katakana(), "コトエリ")

		XCTAssertEqual("コトエリ".LLA.hiragana(), "ことえり")
		XCTAssertEqual("コトエリ".LLA.katakana(), "コトエリ")
	}	
}
