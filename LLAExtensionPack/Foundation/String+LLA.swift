//
//  String+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



// MARK: - Compare
public extension String
{
	public func isEqual(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return caseInsensitiveCompare(str) == .orderedSame
		}
		
		return self == str
	}
}



// MARK: - Find
public extension String
{
	public func hasPrefix(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return uppercased().hasPrefix(str.uppercased())
		}
		
		return hasPrefix(str)
	}
	
	public func hasSuffix(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return uppercased().hasSuffix(str.uppercased())
		}
		
		return hasSuffix(str)
	}
	
	public func contains(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return uppercased().range(of: str.uppercased()) != nil
		}
		
		return range(of: str) != nil
	}
	
	public func range(_ str: String, caseInsensitive: Bool = false) -> Range<String.Index>?
	{
		if caseInsensitive
		{
			return uppercased().range(of: str.uppercased())
		}
		
		return range(of: str)
	}
}



// MARK: - Substring
public extension String
{
	public func startIndex(_ offsetBy: String.IndexDistance) -> String.Index?
	{
		return index(startIndex, offsetBy: offsetBy, limitedBy: endIndex)
	}
	
	public func endIndex(_ offsetBy: String.IndexDistance) -> String.Index?
	{
		return index(endIndex, offsetBy: offsetBy, limitedBy: startIndex)
	}

	public func substring(_ range: NSRange) -> String?
	{
		let lhs = index(startIndex, offsetBy: range.location)
		let rhs = index(startIndex, offsetBy: range.location + range.length - 1)
		
		return String(self[lhs...rhs])
	}

	public func substring(_ start: Int, end: Int) -> String?
	{
		let lhs = index(startIndex, offsetBy: start)
		let rhs = index(startIndex, offsetBy: end)

		return String(self[lhs...rhs])
	}

	public func substringFromIndex(_ index: Int) -> String?
	{
		let lhs = self.index(startIndex, offsetBy: index)
		
		return String(self[lhs...])
	}

	public func substringToIndex(_ index: Int) -> String?
	{
		let rhs = self.index(startIndex, offsetBy: index)
		
		return String(self[..<rhs])
	}
}



// MARK: - Subscript
public extension String
{
	subscript (bounds: CountableClosedRange<Int>) -> String {
		let lhs = index(startIndex, offsetBy: bounds.lowerBound)
		let rhs = index(startIndex, offsetBy: bounds.upperBound)
		return String(self[lhs...rhs])
	}
	
	subscript (bounds: CountableRange<Int>) -> String {
		let lhs = index(startIndex, offsetBy: bounds.lowerBound)
		let rhs = index(startIndex, offsetBy: bounds.upperBound)
		return String(self[lhs..<rhs])
	}
	
	subscript (bounds: PartialRangeUpTo<Int>) -> String {
		let rhs = index(startIndex, offsetBy: bounds.upperBound)
		return String(self[startIndex..<rhs])
	}
	
	subscript (bounds: PartialRangeThrough<Int>) -> String {
		let rhs = index(startIndex, offsetBy: bounds.upperBound)
		return String(self[startIndex...rhs])
	}
	
	subscript (bounds: CountablePartialRangeFrom<Int>) -> String {
		let lhs = index(startIndex, offsetBy: bounds.lowerBound)
		return String(self[lhs..<endIndex])
	}
}



// MARK: - Inspect
public extension String
{
	public func isNumeric() -> Bool
	{
		var res = false
		
		do
		{
			let regex = try NSRegularExpression(pattern: "\\d", options: [])
			let range = NSRange(location: 0, length: count)
			
			let num = regex.numberOfMatches(in:self, options: [], range: range)
			if count == num
			{
				res = true
			}
		}
		catch
		{
			res = false
		}
		
		return res
	}
}



// MARK: - Replace
public extension String
{
	public func replace(_ target: String, replacement: String, caseInsensitive: Bool = false) -> String
	{
		if caseInsensitive
		{
			return replacingOccurrences(of: target, with: replacement, options: .caseInsensitive)
		}
		
		return replacingOccurrences(of: target, with: replacement)
	}
}



// MARK: - Remove
public extension String
{
	public func remove(_ target: String, caseInsensitive: Bool = false) -> String
	{
		return replace(target, replacement: "", caseInsensitive: caseInsensitive)
	}
}


	
// MARK: - Encode
public extension String
{
	public func urlEncoding() -> String
	{
		let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
		let str = removingPercentEncoding ?? self
		
		return str.addingPercentEncoding(withAllowedCharacters: charset) ?? str
	}
}



// MARK: - Hash
public extension String
{
	public func hashMD5() -> String?
	{
		guard let data = data(using: .utf8) else
		{
			return nil
		}

		let length = Int(CC_MD5_DIGEST_LENGTH)
		var digest = [UInt8](repeating: 0, count: length)
		_ = data.withUnsafeBytes { CC_MD5($0, CC_LONG(data.count), &digest) }
		let res = digest.map { String(format: "%02x", $0) }.joined(separator: "")
		
		return res
	}

	public func hashSHA1() -> String?
	{
		guard let data = data(using: .utf8) else
		{
			return nil
		}
		
		let length = Int(CC_SHA1_DIGEST_LENGTH)
		var digest = [UInt8](repeating: 0, count: length)
		_ = data.withUnsafeBytes { CC_SHA1($0, CC_LONG(data.count), &digest) }
		let res = digest.map { String(format: "%02x", $0) }.joined(separator: "")
		
		return res
	}
	
}



// MARK: - Transform (FullwidthHalfwidth)
public extension String
{
	private func transformFullwidthHalfwidth(_ reverse: Bool) -> String
	{
		let str = NSMutableString(string: self) as CFMutableString
		CFStringTransform(str, nil, kCFStringTransformFullwidthHalfwidth, reverse);

		return str as String;
	}

	public func fullWidth() -> String
	{
		return transformFullwidthHalfwidth(true)
	}

	public func halfWidth() -> String
	{
		return transformFullwidthHalfwidth(false)
	}
}



// MARK: - Transform (HiraganaKatakana)
public extension String
{
	private func transformHiraganaKatakana(_ reverse: Bool) -> String
	{
		let str = NSMutableString(string: self) as CFMutableString
		CFStringTransform(str, nil, kCFStringTransformHiraganaKatakana, reverse);
		
		return str as String;
	}
	
	public func hiragana() -> String
	{
		return transformHiraganaKatakana(true)
	}
	
	public func katakana() -> String
	{
		return transformHiraganaKatakana(false)
	}
}
