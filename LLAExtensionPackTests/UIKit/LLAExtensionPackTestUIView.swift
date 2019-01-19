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
		
		XCTAssertEqual(view.LLA.x(), 10)
		XCTAssertEqual(view.LLA.y(), 20)
		XCTAssertEqual(view.LLA.width(), 30)
		XCTAssertEqual(view.LLA.height(), 40)
		
		
		view.LLA.setX(100)
		view.LLA.setY(200)
		view.LLA.setWidth(300)
		view.LLA.setHeight(400)
		
		XCTAssertEqual(view.LLA.x(), 100)
		XCTAssertEqual(view.LLA.y(), 200)
		XCTAssertEqual(view.LLA.width(), 300)
		XCTAssertEqual(view.LLA.height(), 400)
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
			
			view.LLA.removeSubviewOf(tag: 2)
			XCTAssertEqual(view.subviews.count, 1)
			XCTAssertEqual(view.subviews[0].tag, 3)
			
			view.LLA.removeSubviewOf(tag: 4)
			XCTAssertEqual(view.subviews.count, 1)
			XCTAssertEqual(view.subviews[0].tag, 3)
		}()

		
		_ = { () -> () in
			let view = UIView(frame: CGRect(x: 10, y: 20, width: 30, height: 40))
			view.addSubview(UIView())
			view.addSubview(UIView())
			view.addSubview(UIView())
			XCTAssertEqual(view.subviews.count, 3)
			
			view.LLA.removeAllSubviews()
			XCTAssertEqual(view.subviews.count, 0)
		}()

	}
}
