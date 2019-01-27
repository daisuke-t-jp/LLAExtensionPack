//
//  LLAExtensionPackTestUIView.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestUIView: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testProperty() {
		let view = UIView(frame: CGRect(x: 10, y: 20, width: 30, height: 40))
		
		XCTAssertEqual(view.frame.x(), 10)
		XCTAssertEqual(view.frame.y(), 20)
		XCTAssertEqual(view.frame.width(), 30)
		XCTAssertEqual(view.frame.height(), 40)
		
		
		view.frame.setX(100)
		view.frame.setY(200)
		view.frame.setWidth(300)
		view.frame.setHeight(400)
		
		XCTAssertEqual(view.frame.x(), 100)
		XCTAssertEqual(view.frame.y(), 200)
		XCTAssertEqual(view.frame.width(), 300)
		XCTAssertEqual(view.frame.height(), 400)
	}
	
	func testSubview() {
		_ = { () -> () in
			let view = UIView(frame: CGRect(x: 10, y: 20, width: 30, height: 40))
			
			let view2 = UIView(frame: CGRect(x: 10, y: 20, width: 30, height: 40))
			view2.tag = 2
			view.addSubview(view2)
			
			let view3 = UIView(frame: CGRect(x: 10, y: 20, width: 30, height: 40))
			view3.tag = 3
			view.addSubview(view3)
			
			view.removeSubviewOf(tag: 2)
			XCTAssertEqual(view.subviews.count, 1)
			XCTAssertEqual(view.subviews[0].tag, 3)
			
			view.removeSubviewOf(tag: 4)
			XCTAssertEqual(view.subviews.count, 1)
			XCTAssertEqual(view.subviews[0].tag, 3)
		}()

		
		_ = { () -> () in
			let view = UIView(frame: CGRect(x: 10, y: 20, width: 30, height: 40))
			view.addSubview(UIView())
			view.addSubview(UIView())
			view.addSubview(UIView())
			XCTAssertEqual(view.subviews.count, 3)
			
			view.removeAllSubviews()
			XCTAssertEqual(view.subviews.count, 0)
		}()

	}


	func testImage() {
		let view = UIView(frame: CGRect(x: 10, y: 20, width: 30, height: 40))
		view.backgroundColor = UIColor.red

		let image = view.image()

		XCTAssertNotNil(image)
	}
}
