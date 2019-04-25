//
//  CGRect+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/21.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import CoreGraphics



// MARK: - Property
public extension CGRect {

  var x: CGFloat {
    return origin.x
  }
  
  mutating func setX(_ x: CGFloat) {
    origin.x = x
  }
  
  var y: CGFloat {
    return origin.y
  }
  
  mutating func setY(_ y: CGFloat) {
    origin.y = y
  }
  
  mutating func setWidth(_ width: CGFloat) {
    size.width = width
  }
  
  mutating func setHeight(_ height: CGFloat) {
    size.height = height
  }
}
