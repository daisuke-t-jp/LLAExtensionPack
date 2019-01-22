//
//  LLAExtensionPackTestUIColor.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestUIColor: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testUtility() {
		var r : CGFloat = 0
		var g : CGFloat = 0
		var b : CGFloat = 0
		var a : CGFloat = 0

		UIColor.LLA.toRGB(0xFFEEDD, r: &r, g: &g, b: &b)
		XCTAssertEqual(UIColor.LLA.toUInt8(r), 255)
		XCTAssertEqual(UIColor.LLA.toUInt8(g), 238)
		XCTAssertEqual(UIColor.LLA.toUInt8(b), 221)

		
		UIColor.LLA.toRGBA(0xFFEEDDCC, r: &r, g: &g, b: &b, a: &a)
		XCTAssertEqual(UIColor.LLA.toUInt8(r), 255)
		XCTAssertEqual(UIColor.LLA.toUInt8(g), 238)
		XCTAssertEqual(UIColor.LLA.toUInt8(b), 221)
		XCTAssertEqual(UIColor.LLA.toUInt8(a), 204)

		XCTAssertEqual(UIColor.LLA.toUInt8(1.0), 255)
		XCTAssertEqual(UIColor.LLA.toFloat(255), 1.0)
	}

	func testProperty() {
		let color = UIColor.init(red: 1.0, green: 0.75, blue: 0.5, alpha: 0.25)
		XCTAssertEqual(color.LLA.red(), 1.0)
		XCTAssertEqual(color.LLA.green(), 0.75)
		XCTAssertEqual(color.LLA.blue(), 0.5)
		XCTAssertEqual(color.LLA.alpha(), 0.25)
	}

	func testInit() {
		_ = { () -> () in
			let color = UIColor(hexRGB: 0xFFEEDD)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.red()), 255)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.green()), 238)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.blue()), 221)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.alpha()), 255)
		}()

		
		_ = { () -> () in
			let color = UIColor(hexRGBA: 0xFFEEDDCC)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.red()), 255)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.green()), 238)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.blue()), 221)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.alpha()), 204)
		}()

		
		_ = { () -> () in
			let color = UIColor(hexRGB: "FFEEDD")
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.red()), 255)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.green()), 238)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.blue()), 221)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.alpha()), 255)
		}()

		
		_ = { () -> () in
			let color = UIColor(hexRGB: "#FFEEDD")
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.red()), 255)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.green()), 238)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.blue()), 221)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.alpha()), 255)
		}()


		_ = { () -> () in
			let color = UIColor(hexRGBA: "FFEEDDCC")
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.red()), 255)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.green()), 238)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.blue()), 221)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.alpha()), 204)
		}()


		_ = { () -> () in
			let color = UIColor(hexRGBA: "#FFEEDDCC")
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.red()), 255)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.green()), 238)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.blue()), 221)
			XCTAssertEqual(UIColor.LLA.toUInt8(color.LLA.alpha()), 204)
		}()

	}
	
	func testImage() {
		let image = UIColor.init(hexRGBA: 0xFF0000FF).LLA.image(CGSize.init(width: 128, height: 96))

		XCTAssertNotNil(image)
	}
}
