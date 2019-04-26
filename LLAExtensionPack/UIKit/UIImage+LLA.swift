//
//  UIImage+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/22.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



// MARK: - Effect
public extension UIImage {
  
  private func border(_ width: CGFloat, color: UIColor, size: CGSize) -> UIImage? {
    defer {
      UIGraphicsEndImageContext()
    }
    
    let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
    let path = UIBezierPath.init(rect: rect)
    let point = CGPoint.init(x: (size.width - self.size.width) * 0.5,
                             y: (size.height - self.size.height) * 0.5)
    
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    
    draw(at: point)
    color.setStroke()
    path.lineWidth = width * UIScreen.main.scale
    path.stroke()
    
    guard let res = UIGraphicsGetImageFromCurrentImageContext() else {
      return nil
    }
    
    return res
  }
  
  func borderInside(_ width: CGFloat, color: UIColor) -> UIImage? {
    return border(width, color: color, size: self.size)
  }
  
  func borderOutside(_ width: CGFloat, color: UIColor) -> UIImage? {
    let size = CGSize.init(width: self.size.width + width * 2,
                           height: self.size.height + width * 2)
    
    return border(width, color: color, size: size)
  }
}



// MARK: - Transform
public extension UIImage {
  
  func rotate(degree: Int, point: CGPoint? = nil) -> UIImage? {
    return rotate(radian: degree.radianCGFloat, point: point)
  }
  
  func rotate(radian: CGFloat, point: CGPoint? = nil) -> UIImage? {
    
    defer {
      UIGraphicsEndImageContext()
    }
    
    
    var point2 = point
    if point2 == nil {
      point2 = CGPoint.init(x: self.size.width * 0.5, y: self.size.height * 0.5)
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSize.init(width: self.size.width, height: self.size.height), false, 0)
    guard let context = UIGraphicsGetCurrentContext() else {
      return nil
    }
    
    guard let cgImage = self.cgImage else {
      return nil
    }
    
    
    context.translateBy(x: point2!.x, y: point2!.y)
    context.scaleBy(x: 1.0, y: -1.0)
    context.rotate(by: -radian)
    context.translateBy(x: -(point2!.x - self.size.width * 0.5),
                        y: (point2!.y - self.size.height * 0.5))
    context.draw(cgImage, in: CGRect.init(x: -self.size.width * 0.5,
                                          y: -self.size.height * 0.5,
                                          width: self.size.width,
                                          height: self.size.height))
    
    guard let res = UIGraphicsGetImageFromCurrentImageContext() else {
      return nil
    }
    
    return res
  }
}
