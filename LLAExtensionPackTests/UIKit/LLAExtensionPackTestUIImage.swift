//
//  LLAExtensionPackTestUIImage.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/01/22.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestUIImage: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testEffect() {
		_ = { () -> () in
			let image = UIColor.red.LLA.image(CGSize.init(width: 80, height: 80))

			let image2 = image!.LLA.borderInside(10, color: UIColor.blue)
			XCTAssertNotNil(image2)
		}()

		_ = { () -> () in
			let image = UIColor.red.LLA.image(CGSize.init(width: 80, height: 80))
			
			let image2 = image!.LLA.borderOutside(10, color: UIColor.blue)
			XCTAssertNotNil(image2)
		}()
	}

	func testTransform() {
		_ = { () -> () in
			let image = UIColor.red.LLA.image(CGSize.init(width: 128, height: 96))
			
			let image2 = image!.LLA.rotate(degree: 45)
			XCTAssertNotNil(image2)
		}()

		_ = { () -> () in
			let image = UIColor.red.LLA.image(CGSize.init(width: 128, height: 96))
			
			let image2 = image!.LLA.rotate(degree: 45, point: CGPoint.init(x: 0, y: 0))
			XCTAssertNotNil(image2)
		}()

		_ = { () -> () in
			let image = UIColor.red.LLA.image(CGSize.init(width: 128, height: 96))
			
			let image2 = image!.LLA.rotate(radian: 45.radianCGFloat)
			XCTAssertNotNil(image2)
		}()
		
		_ = { () -> () in
			let image = UIColor.red.LLA.image(CGSize.init(width: 128, height: 96))
			
			let image2 = image!.LLA.rotate(radian: 45.radianCGFloat, point: CGPoint.init(x: 0, y: 0))
			XCTAssertNotNil(image2)
		}()

	}
}
