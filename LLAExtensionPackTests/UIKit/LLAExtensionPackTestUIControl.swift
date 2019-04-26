//
//  LLAExtensionPackTestUIControl.swift
//  LLAExtensionPackTests
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import XCTest

@testable import LLAExtensionPack



class LLAExtensionPackTestUIControl: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  class DummyView : UIView
  {
    @objc public func dummyFunc(){}
  }
  
  func test() {
    
    let control = UIControl()
    let obj = DummyView()
    let obj2 = DummyView()
    
    control.addTarget(obj, action: #selector(obj.dummyFunc), for: .touchUpInside)
    control.addTarget(obj2, action: #selector(obj2.dummyFunc), for: .touchUpInside)
    XCTAssertEqual(control.allTargets.count, 2)
    
    control.removeAllTarget()
    
    XCTAssertEqual(control.allTargets.count, 0)
  }
  
}
