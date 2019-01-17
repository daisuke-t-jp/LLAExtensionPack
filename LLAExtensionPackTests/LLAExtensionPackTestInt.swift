//
//  LLAExtensionPackTestInt.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestInt: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecimal() {

		XCTAssertEqual(1234.LLA.decimalFormatString(Locale.LLA.LocaleIdentifier.en_US), "1,234")
		XCTAssertEqual(1234.LLA.decimalFormatString(Locale.LLA.LocaleIdentifier.ja_JP), "1,234")

	}

	func testCurrency() {
		
		XCTAssertEqual(1234.LLA.currencyFormatString(Locale.LLA.LocaleIdentifier.en_US), "$1,234.00")
		XCTAssertEqual(1234.LLA.currencyFormatString(Locale.LLA.LocaleIdentifier.ja_JP), "¥1,234")

	}
}
