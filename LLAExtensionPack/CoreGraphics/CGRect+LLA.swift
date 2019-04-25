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

  public var x: CGFloat {
    return origin.x
  }
  
  public mutating func setX(_ x: CGFloat) {
    origin.x = x
  }
  
  public var y: CGFloat {
    return origin.y
  }
  
  public mutating func setY(_ y: CGFloat) {
    origin.y = y
  }
  
  public mutating func setWidth(_ width: CGFloat) {
    size.width = width
  }
  
  public mutating func setHeight(_ height: CGFloat) {
    size.height = height
  }
}
