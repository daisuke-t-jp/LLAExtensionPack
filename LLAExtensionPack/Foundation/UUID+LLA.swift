//
//  UUID+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/17.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



public extension UUID {
  
  static var string: String {
    return UUID().uuidString
  }
  
  var string: String {
    return uuidString
  }
}
