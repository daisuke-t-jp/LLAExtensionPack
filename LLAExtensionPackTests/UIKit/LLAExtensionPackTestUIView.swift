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
    
    XCTAssertEqual(view.x, 10)
    XCTAssertEqual(view.y, 20)
    XCTAssertEqual(view.width, 30)
    XCTAssertEqual(view.height, 40)
    
    
    view.setX(100)
    view.setY(200)
    view.setWidth(300)
    view.setHeight(400)
    
    XCTAssertEqual(view.x, 100)
    XCTAssertEqual(view.y, 200)
    XCTAssertEqual(view.width, 300)
    XCTAssertEqual(view.height, 400)
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
    
    let image = view.image
    
    XCTAssertNotNil(image)
  }
}
