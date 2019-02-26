//
//  UIColor+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/10.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



// MARK: - Init
public extension UIColor {

	convenience init(hexRGB: UInt32) {
		self.init(hexRGBA: (hexRGB << 8) | 0xFF)
	}
	
	convenience init(hexRGBA: UInt32) {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		UIColor.toRGBA(hexRGBA, r: &r, g: &g, b: &b, a: &a)

		self.init(red: r, green: g, blue: b, alpha: a)
	}

	convenience init(hexRGB: String) {
		self.init(hexRGBA: hexRGB + "FF")
	}

	convenience init(hexRGBA: String) {
		let str = hexRGBA.remove("#")

		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		var tmp: UInt32 = 0
		if Scanner(string: str).scanHexInt32(&tmp) {
			UIColor.toRGBA(tmp, r: &r, g: &g, b: &b, a: &a)
		}

		self.init(red: r, green: g, blue: b, alpha: a)
	}
}



// MARK: - Utility
public extension UIColor {

	static public func toRGB(_ hexRGB: UInt32,
							 r: inout CGFloat,
							 g: inout CGFloat,
							 b: inout CGFloat) {
		var a: CGFloat = 0
		toRGBA((hexRGB << 8) | 0xFF, r: &r, g: &g, b: &b, a: &a)
	}
	
	static public func toRGBA(_ hexRGBA: UInt32,
							  r: inout CGFloat,
							  g: inout CGFloat,
							  b: inout CGFloat,
							  a: inout CGFloat) {
		r = UIColor.toFloat(UInt8((hexRGBA & 0xFF000000) >> 24))
		g = UIColor.toFloat(UInt8((hexRGBA & 0x00FF0000) >> 16))
		b = UIColor.toFloat(UInt8((hexRGBA & 0x0000FF00) >> 8))
		a = UIColor.toFloat(UInt8(hexRGBA & 0x000000FF))
	}
	
	static public func toUInt8(_ f: CGFloat) -> UInt8 {
		return UInt8(clamping: UInt(f * 255.0))
	}

	static public func toFloat(_ u: UInt8) -> CGFloat {
		return LLAExtensionPack.clamp(CGFloat(u) / 255.0, min: 0.0, max: 255.0)
	}
}



// MARK: - Property
public extension UIColor {
	
	public var red: CGFloat {
		var res: CGFloat = 0
		getRed(&res, green: nil, blue: nil, alpha: nil)
		return res
	}

	public var green: CGFloat {
		var res: CGFloat = 0
		getRed(nil, green: &res, blue: nil, alpha: nil)
		return res
	}

	public var blue: CGFloat {
		var res: CGFloat = 0
		getRed(nil, green: nil, blue: &res, alpha: nil)
		return res
	}

	public var alpha: CGFloat {
		var res: CGFloat = 0
		getRed(nil, green: nil, blue: nil, alpha: &res)
		return res
	}
}



// MARK: - Preset
public extension UIColor {

	static public var presetMaterialRed: UIColor {
		return UIColor(hexRGB: 0xF44336)
	}
	
	static public var presetMaterialPink: UIColor {
		return UIColor(hexRGB: 0xE91E63)
	}
	
	static public var presetMaterialPurple: UIColor {
		return UIColor(hexRGB: 0x9C27B0)
	}
	
	static public var presetMaterialDeepPurple: UIColor {
		return UIColor(hexRGB: 0x673AB7)
	}
	
	static public var presetMaterialIndigo: UIColor {
		return UIColor(hexRGB: 0x3F51B5)
	}
	
	static public var presetMaterialBlue: UIColor {
		return UIColor(hexRGB: 0x2196F3)
	}
	
	static public var presetMaterialLightBlue: UIColor {
		return UIColor(hexRGB: 0x03A9F4)
	}
	
	static public var presetMaterialCyan: UIColor {
		return UIColor(hexRGB: 0x00BCD4)
	}
	
	static public var presetMaterialTeal: UIColor {
		return UIColor(hexRGB: 0x009688)
	}
	
	static public var presetMaterialGreen: UIColor {
		return UIColor(hexRGB: 0x4CAF50)
	}
	
	static public var presetMaterialLightGreen: UIColor {
		return UIColor(hexRGB: 0x8BC34A)
	}
	
	static public var presetMaterialYellow: UIColor {
		return UIColor(hexRGB: 0xFFEB3B)
	}
	
	static public var presetMaterialAmber: UIColor {
		return UIColor(hexRGB: 0xFFC107)
	}
	
	static public var presetMaterialOrange: UIColor {
		return UIColor(hexRGB: 0xFF9800)
	}
	
	static public var presetMaterialDeepOrange: UIColor {
		return UIColor(hexRGB: 0xFF5722)
	}
	
	static public var presetMaterialBrown: UIColor {
		return UIColor(hexRGB: 0x795548)
	}
	
	static public var presetMaterialGrey: UIColor {
		return UIColor(hexRGB: 0x9E9E9E)
	}
	
	static public var presetMaterialBlueGrey: UIColor {
		return UIColor(hexRGB: 0x607D8B)
	}
}



// MARK: - UIImage
public extension UIColor {

	public func image(_ size: CGSize) -> UIImage? {

		defer {
			UIGraphicsEndImageContext()
		}


		let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

		UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		context.setFillColor(self.cgColor)
		context.fill(rect)

		guard let res = UIGraphicsGetImageFromCurrentImageContext() else {
			return nil
		}

		return res
	}
}
