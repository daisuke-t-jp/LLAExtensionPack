//
//  FloatingPoint+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/22.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



public extension FloatingPoint {
  
  var string: String {
    return String(format: "%f", self as? CVarArg ?? 0)
  }
  
  var radian: Self {
    return self * .pi / 180
  }
  
  var degree: Self {
    return self * 180 / .pi
  }
}
