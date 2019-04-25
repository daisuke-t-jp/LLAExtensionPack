//
//  BinaryInteger+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/22.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



public extension BinaryInteger {

  var radianDouble: Double {
    return Double(self) * .pi / 180
  }

  var radianFloat: Float {
    return Float(self) * .pi / 180
  }

  var radianCGFloat: CGFloat {
    return CGFloat(self) * .pi / 180
  }
}
