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
		XCTAssertEqual("string".md2, "a06d078cf87b3349d4400afca892ed42")
		XCTAssertEqual("string".md4, "70a2421dd08cce128b3af8ad1dfa74ac")
		XCTAssertEqual("string".md5, "b45cffe084dd3d20d928bee85e7b0f21")
		XCTAssertEqual("string".sha1, "ecb252044b5ea0f679ee78ec1a12904739e2904d")
		XCTAssertEqual("string".sha224, "474b4afcaa4303cfc8f697162784293e812f12e2842551d726db8037")
		XCTAssertEqual("string".sha256, "473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8")
		XCTAssertEqual("string".sha384, "36396a7e4de3fa1c2156ad291350adf507d11a8f8be8b124a028c5db40785803ca35a7fc97a6748d85b253babab7953e")
		XCTAssertEqual("string".sha512, "2757cb3cafc39af451abb2697be79b4ab61d63d74d85b0418629de8c26811b529f3f3780d0150063ff55a2beee74c4ec102a2a2731a1f1f7f10d473ad18a6a87")
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
