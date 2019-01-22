//
//  UIImage+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2019/01/22.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



extension UIImage: LLANamespaceWrapper {}

// MARK: - Effect
public extension LLATypeWrapper where T == UIImage
{
	private func border(_ width: CGFloat, color: UIColor, size: CGSize) -> UIImage?
	{
		defer {
			UIGraphicsEndImageContext();
		}

		let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
		let path = UIBezierPath.init(rect: rect)
		let point = CGPoint.init(x: (size.width - SELF.size.width) * 0.5,
								 y: (size.height - SELF.size.height) * 0.5)

		UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

		SELF.draw(at: point)
		color.setStroke()
		path.lineWidth = width * UIScreen.main.scale
		path.stroke()

		guard let res = UIGraphicsGetImageFromCurrentImageContext() else
		{
			return nil
		}

		return res
	}
	
	public func borderInside(_ width: CGFloat, color: UIColor) -> UIImage?
	{
		return border(width, color: color, size: SELF.size)
	}

	public func borderOutside(_ width: CGFloat, color: UIColor) -> UIImage?
	{
		let size = CGSize.init(width: SELF.size.width + width * 2,
							   height: SELF.size.height + width * 2)

		return border(width, color: color, size: size)
	}
}



// MARK: - Transform
public extension LLATypeWrapper where T == UIImage
{
	public func rotate(degree: Int, point: CGPoint? = nil) -> UIImage?
	{
		return rotate(radian: degree.radianCGFloat, point: point)
	}

	public func rotate(radian: CGFloat, point: CGPoint? = nil) -> UIImage?
	{
		defer {
			UIGraphicsEndImageContext();
		}


		var point2 = point
		if point2 == nil
		{
			point2 = CGPoint.init(x: SELF.size.width * 0.5, y: SELF.size.height * 0.5)
		}

		UIGraphicsBeginImageContextWithOptions(CGSize.init(width: SELF.size.width, height: SELF.size.height), false, 0)
		guard let context = UIGraphicsGetCurrentContext() else
		{
			return nil
		}

		guard let cgImage = SELF.cgImage else
		{
			return nil
		}


		context.translateBy(x: point2!.x, y: point2!.y)
		context.scaleBy(x: 1.0, y: -1.0)
		context.rotate(by: -radian)
		context.translateBy(x: -(point2!.x - SELF.size.width * 0.5),
							y: (point2!.y - SELF.size.height * 0.5))
		context.draw(cgImage, in: CGRect.init(x: -SELF.size.width * 0.5,
											  y: -SELF.size.height * 0.5,
											  width: SELF.size.width,
											  height: SELF.size.height))

		guard let res = UIGraphicsGetImageFromCurrentImageContext() else
		{
			return nil
		}

		return res
	}
}
