//
//  UIControl+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



public extension UIControl {
  
  func removeAllTarget() {
    self.removeTarget(nil, action: nil, for: .allEvents)
  }
}
