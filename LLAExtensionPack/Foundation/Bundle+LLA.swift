//
//  Bundle+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



public extension Bundle {

  var shortVersion: String? {

    guard let dict = infoDictionary else {
      return nil
    }
    
    return dict["CFBundleShortVersionString"] as? String
  }

  var version: String? {

    guard let dict = infoDictionary else {
      return nil
    }
    
    return dict["CFBundleVersion"] as? String
  }
  
  var identifier: String {
    return bundleIdentifier!
  }
}
