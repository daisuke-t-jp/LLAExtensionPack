//
//  String+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



extension String: LLANamespaceWrapper {}

// MARK: Compare
public extension LLATypeWrapper where T == String
{
	public func isEqual(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return SELF.caseInsensitiveCompare(str) == .orderedSame
		}
		
		return SELF == str
	}
}



// MARK: Find
public extension LLATypeWrapper where T == String
{
	public func hasPrefix(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return SELF.uppercased().hasPrefix(str.uppercased())
		}
		
		return SELF.hasPrefix(str)
	}
	
	public func hasSuffix(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return SELF.uppercased().hasSuffix(str.uppercased())
		}
		
		return SELF.hasSuffix(str)
	}
	
	public func contains(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return SELF.uppercased().range(of: str.uppercased()) != nil
		}
		
		return SELF.range(of: str) != nil
	}
	
	public func range(_ str: String, caseInsensitive: Bool = false) -> Range<String.Index>?
	{
		if caseInsensitive
		{
			return SELF.uppercased().range(of: str.uppercased())
		}
		
		return SELF.range(of: str)
	}
}



// MARK: Substring
public extension LLATypeWrapper where T == String
{
	public func startIndex(_ offsetBy: String.IndexDistance) -> String.Index?
	{
		return SELF.index(SELF.startIndex, offsetBy: offsetBy, limitedBy: SELF.endIndex)
	}
	
	public func endIndex(_ offsetBy: String.IndexDistance) -> String.Index?
	{
		return SELF.index(SELF.endIndex, offsetBy: offsetBy, limitedBy: SELF.startIndex)
	}

	public func substring(_ range: NSRange) -> String?
	{
		let lhs = SELF.index(SELF.startIndex, offsetBy: range.location)
		let rhs = SELF.index(SELF.startIndex, offsetBy: range.location + range.length - 1)
		
		return String(SELF[lhs...rhs])
	}

	public func substring(_ start: Int, end: Int) -> String?
	{
		let lhs = SELF.index(SELF.startIndex, offsetBy: start)
		let rhs = SELF.index(SELF.startIndex, offsetBy: end)

		return String(SELF[lhs...rhs])
	}

	public func substringFromIndex(_ index: Int) -> String?
	{
		let lhs = SELF.index(SELF.startIndex, offsetBy: index)
		
		return String(SELF[lhs...])
	}

	public func substringToIndex(_ index: Int) -> String?
	{
		let rhs = SELF.index(SELF.startIndex, offsetBy: index)
		
		return String(SELF[..<rhs])
	}
}



// MARK: Inspect
public extension LLATypeWrapper where T == String
{
	public func isNumeric() -> Bool
	{
		var res = false
		
		do
		{
			let regex = try NSRegularExpression(pattern: "\\d", options: [])
			let range = NSRange(location: 0, length: SELF.count)
			
			let num = regex.numberOfMatches(in:SELF, options: [], range: range)
			if SELF.count == num
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



// MARK: Replace
public extension LLATypeWrapper where T == String
{
	public func replace(_ target: String, replacement: String, caseInsensitive: Bool = false) -> String
	{
		if caseInsensitive
		{
			return SELF.replacingOccurrences(of: target, with: replacement, options: .caseInsensitive)
		}
		
		return SELF.replacingOccurrences(of: target, with: replacement)
	}
}



// MARK: Remove
public extension LLATypeWrapper where T == String
{
	public func remove(_ target: String, caseInsensitive: Bool = false) -> String
	{
		return replace(target, replacement: "", caseInsensitive: caseInsensitive)
	}
}


	
// MARK: Encode
public extension LLATypeWrapper where T == String
{
	public func urlEncoding() -> String
	{
		let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
		let str = SELF.removingPercentEncoding ?? SELF
		
		return str.addingPercentEncoding(withAllowedCharacters: charset) ?? str
	}
}



// MARK: Hash
public extension LLATypeWrapper where T == String
{
	public func hashMD5() -> String?
	{
		guard let data = SELF.data(using: .utf8) else
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
		guard let data = SELF.data(using: .utf8) else
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



// MARK: Transform
public extension LLATypeWrapper where T == String
{
	fileprivate func transformFullwidthHalfwidth(_ reverse: Bool) -> String
	{
		let str = NSMutableString(string: SELF) as CFMutableString
		CFStringTransform(str, nil, kCFStringTransformFullwidthHalfwidth, reverse);

		return str as String;
	}

	public func halfWidth() -> String
	{
		return transformFullwidthHalfwidth(false)
	}

	public func fullWidth() -> String
	{
		return transformFullwidthHalfwidth(true)
	}
}
