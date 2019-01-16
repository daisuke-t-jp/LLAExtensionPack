//
//  String+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



extension String: LLANamespaceWrapper {}
public extension LLATypeWrapper where T == String
{
	// MARK: compare
	public func isEqual(_ str: String, caseInsensitive: Bool = false) -> Bool
	{
		if caseInsensitive
		{
			return SELF.caseInsensitiveCompare(str) == .orderedSame
		}
		
		return SELF == str
	}
	
	
	
	// MARK: find
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
	
	
	
	// MARK: inspect
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
	
	
	
	// MARK: replace
	public func replace(_ target: String, replacement: String, caseInsensitive: Bool = false) -> String
	{
		if caseInsensitive
		{
			return SELF.replacingOccurrences(of: target, with: replacement, options: .caseInsensitive)
		}
		
		return SELF.replacingOccurrences(of: target, with: replacement)
	}
	
	
	
	// MARK: remove
	public func remove(_ target: String, caseInsensitive: Bool = false) -> String
	{
		return replace(target, replacement: "", caseInsensitive: caseInsensitive)
	}
	
	
	
	// MARK: transform
	public var urlEncoding: String
	{
		let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
		let str = SELF.removingPercentEncoding ?? SELF
		
		return str.addingPercentEncoding(withAllowedCharacters: charset) ?? str
	}
	
}
