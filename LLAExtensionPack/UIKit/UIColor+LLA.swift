//
//  UIColor+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/10.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



extension UIColor: LLANamespaceWrapper {}

// MARK: Init
public extension UIColor
{
	convenience init(hexRGB: UInt32)
	{
		self.init(hexRGBA: (hexRGB << 8) | 0xFF)
	}
	
	convenience init(hexRGBA: UInt32)
	{
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		UIColor.LLA.toRGBA(hexRGBA, r: &r, g: &g, b: &b, a: &a)

		self.init(red: r, green: g, blue: b, alpha: a)
	}

	convenience init(hexRGB: String)
	{
		self.init(hexRGBA: hexRGB + "FF")
	}

	convenience init(hexRGBA: String)
	{
		let str = hexRGBA.LLA.remove("#")

		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		var tmp: UInt32 = 0
		if Scanner(string: str).scanHexInt32(&tmp) {
			UIColor.LLA.toRGBA(tmp, r: &r, g: &g, b: &b, a: &a)
		}

		self.init(red: r, green: g, blue: b, alpha: a)
	}
}



// MARK: Utility
public extension LLATypeWrapper where T == UIColor
{
	static public func toRGB(_ hexRGB: UInt32,
							 r: inout CGFloat,
							 g: inout CGFloat,
							 b: inout CGFloat) -> Void
	{
		var a: CGFloat = 0
		toRGBA((hexRGB << 8) | 0xFF, r: &r, g: &g, b: &b, a: &a)
	}
	
	static public func toRGBA(_ hexRGBA: UInt32,
							  r: inout CGFloat,
							  g: inout CGFloat,
							  b: inout CGFloat,
							  a: inout CGFloat) -> Void
	{
		r = UIColor.LLA.toFloat(UInt8((hexRGBA & 0xFF000000) >> 24))
		g = UIColor.LLA.toFloat(UInt8((hexRGBA & 0x00FF0000) >> 16))
		b = UIColor.LLA.toFloat(UInt8((hexRGBA & 0x0000FF00) >> 8))
		a = UIColor.LLA.toFloat(UInt8(hexRGBA & 0x000000FF))
	}
	
	static public func toUInt8(_ f: CGFloat) -> UInt8
	{
		return UInt8(clamping: UInt(f * 255.0))
	}

	static public func toFloat(_ u: UInt8) -> CGFloat
	{
		return LLAExtensionPack.clamp(CGFloat(u) / 255.0, min: 0.0, max: 255.0)
	}
}



// MARK: Property
public extension LLATypeWrapper where T == UIColor
{
	public func red() -> CGFloat
	{
		var res: CGFloat = 0
		SELF.getRed(&res, green: nil, blue: nil, alpha: nil)
		return res
	}

	public func green() -> CGFloat
	{
		var res: CGFloat = 0
		SELF.getRed(nil, green: &res, blue: nil, alpha: nil)
		return res
	}

	public func blue() -> CGFloat
	{
		var res: CGFloat = 0
		SELF.getRed(nil, green: nil, blue: &res, alpha: nil)
		return res
	}

	public func alpha() -> CGFloat
	{
		var res: CGFloat = 0
		SELF.getRed(nil, green: nil, blue: nil, alpha: &res)
		return res
	}
}



// MARK: Preset
public extension LLATypeWrapper where T == UIColor
{
	static public func presetMaterialRed() -> UIColor {
		return UIColor(hexRGB:0xF44336)
	}
	
	static public func presetMaterialPink() -> UIColor {
		return UIColor(hexRGB:0xE91E63)
	}
	
	static public func presetMaterialPurple() -> UIColor {
		return UIColor(hexRGB:0x9C27B0)
	}
	
	static public func presetMaterialDeepPurple() -> UIColor {
		return UIColor(hexRGB:0x673AB7)
	}
	
	static public func presetMaterialIndigo() -> UIColor {
		return UIColor(hexRGB:0x3F51B5)
	}
	
	static public func presetMaterialBlue() -> UIColor {
		return UIColor(hexRGB:0x2196F3)
	}
	
	static public func presetMaterialLightBlue() -> UIColor {
		return UIColor(hexRGB:0x03A9F4)
	}
	
	static public func presetMaterialCyan() -> UIColor {
		return UIColor(hexRGB:0x00BCD4)
	}
	
	static public func presetMaterialTeal() -> UIColor {
		return UIColor(hexRGB:0x009688)
	}
	
	static public func presetMaterialGreen() -> UIColor {
		return UIColor(hexRGB:0x4CAF50)
	}
	
	static public func presetMaterialLightGreen() -> UIColor {
		return UIColor(hexRGB:0x8BC34A)
	}
	
	static public func presetMaterialYellow() -> UIColor {
		return UIColor(hexRGB:0xFFEB3B)
	}
	
	static public func presetMaterialAmber() -> UIColor {
		return UIColor(hexRGB:0xFFC107)
	}
	
	static public func presetMaterialOrange() -> UIColor {
		return UIColor(hexRGB:0xFF9800)
	}
	
	static public func presetMaterialDeepOrange() -> UIColor {
		return UIColor(hexRGB:0xFF5722)
	}
	
	static public func presetMaterialBrown() -> UIColor {
		return UIColor(hexRGB:0x795548)
	}
	
	static public func presetMaterialGrey() -> UIColor {
		return UIColor(hexRGB:0x9E9E9E)
	}
	
	static public func presetMaterialBlueGrey() -> UIColor {
		return UIColor(hexRGB:0x607D8B)
	}
}
