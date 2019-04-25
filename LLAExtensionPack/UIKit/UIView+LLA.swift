//
//  UIView+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



// MARK: - Enum, Const
public extension UIView {
  fileprivate static let layerNameCorner = "lla_layer_corner"
  fileprivate static let layerNameBorder = "lla_layer_border"
}



// MARK: - Property
public extension UIView {
  var x: CGFloat {
    return self.frame.x
  }
  
  func setX(_ x: CGFloat) {
    self.frame.origin.x = x
  }
  
  var y: CGFloat {
    return self.frame.origin.y
  }
  
  func setY(_ y: CGFloat) {
    self.frame.origin.y = y
  }

  var width: CGFloat {
    return self.frame.size.width
  }

  func setWidth(_ width: CGFloat) {
    self.frame.size.width = width
  }

  var height: CGFloat {
    return self.frame.size.height
  }

  func setHeight(_ height: CGFloat) {
    self.frame.size.height = height
  }
}



// MARK: - Layer
public extension UIView {
  
  func setCircled(_ flag: Bool) {
    if flag {
      self.layer.cornerRadius = self.frame.width * 0.5
      return
    }

    self.layer.cornerRadius = 0
  }
}



// MARK: - Layer(Corner)
public extension UIView {

  func layerCorner() -> CAShapeLayer? {

    guard let layer = self.layer.mask as? CAShapeLayer else {
      return nil
    }

    if layer.name == UIView.layerNameCorner {
      return layer
    }

    return nil
  }

  func setCorners(_ corners: UIRectCorner, radius: CGFloat) {
    removeCorners()

    if corners.isEmpty {
      return
    }


    let cornerRadii = CGSize(width: radius, height: radius)
    let path = UIBezierPath.init(roundedRect: self.bounds,
                   byRoundingCorners: corners,
                   cornerRadii: cornerRadii)

    let layer = CAShapeLayer.init()
    layer.path = path.cgPath
    layer.frame = self.bounds
    layer.name = UIView.layerNameCorner

    self.layer.mask = layer
    self.layer.masksToBounds = true
  }
  
  func removeCorners() {

    guard let layer = layerCorner() else {
      return
    }

    layer.mask = nil
    layer.masksToBounds = false
  }
}



// MARK: - Layer(Border)
public extension UIView {

  func layerBorder() -> CAShapeLayer? {

    guard let res = self.layer.sublayerWithName(UIView.layerNameBorder) as? CAShapeLayer else {
      return nil
    }

    return res
  }

  func setBorder(_ width: CGFloat, color: UIColor) {
    removeBorder()

    guard let cornerLayer = layerCorner() else {
      // corner layer none.
      self.layer.borderWidth = width
      self.layer.borderColor = color.cgColor
      return
    }

    
    // corner layer exist.
    guard cornerLayer.path != nil else {
      return
    }

    
    let layer = CAShapeLayer.init()
    layer.path = cornerLayer.path
    layer.fillColor = UIColor.clear.cgColor
    layer.strokeColor = color.cgColor
    layer.lineWidth = width
    layer.frame = self.bounds
    layer.name = UIView.layerNameBorder
    
    self.layer.addSublayer(layer)
  }

  func removeBorder() {

    guard let layer = layerBorder() else {
      // border layer none.
      self.layer.borderWidth = 0
      self.layer.borderColor = UIColor.clear.cgColor
      return
    }

    
    // border layer exist.
    layer.removeFromSuperlayer()
  }
}



// MARK: - Gestures
public extension UIView {

  func setIsExclusiveTouchRecursive(_ flag: Bool) {

    for subview in self.subviews {
      guard subview.isKind(of: UIButton.self) else {
        continue
      }
      
      guard let button: UIButton = subview as? UIButton else {
        continue
      }

      button.isExclusiveTouch = flag
      
      // function recursive call.
      subview.setIsExclusiveTouchRecursive(flag)
    }
  }

  func removeGestureRecognizers() {

    for elm in self.gestureRecognizers ?? [] {
      removeGestureRecognizer(elm)
    }
  }
}



// MARK: - Subviews
public extension UIView {

  func removeSubviewOf(tag: Int) {

    for view in self.subviews {

      if view.tag != tag {
        continue
      }
      
      view.removeFromSuperview()

      break
    }
  }
  
  func removeAllSubviews() {
    for view in self.subviews {
      view.removeFromSuperview()
    }
  }
}



// MARK: - Inspect
public extension UIView {

  func isKindOfRecursive(_ clazz: AnyClass) -> UIView? {

    for subview in self.subviews {
      if subview.isKind(of: clazz) {
        return subview
      }

      
      // function recursive call.
      let view = subview.isKindOfRecursive(clazz)
      if view != nil {
        return view
      }
    }
  
    return nil
  }

  func isMemberOfRecursive(_ clazz: AnyClass) -> UIView? {

    for subview in self.subviews {
      if subview.isMember(of: clazz) {
        return subview
      }
      
      
      // function recursive call.
      let view = subview.isMemberOfRecursive(clazz)
      if view != nil {
        return view
      }
    }
    
    return nil
  }
  
  func findFirstResponder() -> UIView? {
    if self.isFirstResponder {
      return self
    }

    
    for subview in self.subviews {
      let view: UIView? = subview.findFirstResponder()
      if view != nil {
        return view
      }
    }
    
    return nil
  }

}



// MARK: - UIImage
public extension UIView {

  var image: UIImage? {
    defer {
      UIGraphicsEndImageContext()
    }


    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
    guard let context = UIGraphicsGetCurrentContext() else {
      return nil
    }
    
    self.layer.render(in: context)
    
    guard let res = UIGraphicsGetImageFromCurrentImageContext() else {
      return nil
    }
    
    return res
  }
}
