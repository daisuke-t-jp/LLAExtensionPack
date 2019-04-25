//
//  String+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



// MARK: - Compare
public extension String {

  func isEqual(_ str: String, caseInsensitive: Bool = false) -> Bool {

    if caseInsensitive {
      return caseInsensitiveCompare(str) == .orderedSame
    }
    
    return self == str
  }

}



// MARK: - Find
public extension String {

  func hasPrefix(_ str: String, caseInsensitive: Bool = false) -> Bool {

    if caseInsensitive {
      return uppercased().hasPrefix(str.uppercased())
    }
    
    return hasPrefix(str)
  }
  
  func hasSuffix(_ str: String, caseInsensitive: Bool = false) -> Bool {

    if caseInsensitive {
      return uppercased().hasSuffix(str.uppercased())
    }
    
    return hasSuffix(str)
  }
  
  func contains(_ str: String, caseInsensitive: Bool = false) -> Bool {

    if caseInsensitive {
      return uppercased().range(of: str.uppercased()) != nil
    }
    
    return range(of: str) != nil
  }
  
  func range(_ str: String, caseInsensitive: Bool = false) -> Range<String.Index>? {

    if caseInsensitive {
      return uppercased().range(of: str.uppercased())
    }
    
    return range(of: str)
  }
}



// MARK: - Substring
public extension String {

  func startIndex(_ offsetBy: String.IndexDistance) -> String.Index? {
    return index(startIndex, offsetBy: offsetBy, limitedBy: endIndex)
  }
  
  func endIndex(_ offsetBy: String.IndexDistance) -> String.Index? {
    return index(endIndex, offsetBy: offsetBy, limitedBy: startIndex)
  }

  func substring(_ range: NSRange) -> String? {
    let lhs = index(startIndex, offsetBy: range.location)
    let rhs = index(startIndex, offsetBy: range.location + range.length - 1)
    
    return String(self[lhs...rhs])
  }

  func substring(_ start: Int, end: Int) -> String? {
    let lhs = index(startIndex, offsetBy: start)
    let rhs = index(startIndex, offsetBy: end)

    return String(self[lhs...rhs])
  }

  func substringFromIndex(_ index: Int) -> String? {
    let lhs = self.index(startIndex, offsetBy: index)
    
    return String(self[lhs...])
  }

  func substringToIndex(_ index: Int) -> String? {
    let rhs = self.index(startIndex, offsetBy: index)
    
    return String(self[..<rhs])
  }
}



// MARK: - Subscript
public extension String {
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
public extension String {

  var isNumeric: Bool {

    var res = false

    do {
      let regex = try NSRegularExpression(pattern: "\\d", options: [])
      let range = NSRange(location: 0, length: count)
      
      let num = regex.numberOfMatches(in: self, options: [], range: range)
      if count == num {
        res = true
      }
    } catch {
      res = false
    }
    
    return res
  }
}



// MARK: - Replace
public extension String {

  func replace(_ target: String, replacement: String, caseInsensitive: Bool = false) -> String {

    if caseInsensitive {
      return replacingOccurrences(of: target, with: replacement, options: .caseInsensitive)
    }
    
    return replacingOccurrences(of: target, with: replacement)
  }

}



// MARK: - Remove
public extension String {

  func remove(_ target: String, caseInsensitive: Bool = false) -> String {
    return replace(target, replacement: "", caseInsensitive: caseInsensitive)
  }

}


  
// MARK: - Encode
public extension String {

  var urlEncoding: String {
    let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
    let str = removingPercentEncoding ?? self
    
    return str.addingPercentEncoding(withAllowedCharacters: charset) ?? str
  }
}



// MARK: - Hash
public extension String {

  private enum HashType {
    case MD2
    case MD4
    case MD5
    case SHA1
    case SHA224
    case SHA256
    case SHA384
    case SHA512
  }

  private func hashing(_ type: HashType) -> String? {

    guard let data = data(using: .utf8) else {
      return nil
    }

    let lengthMap: [HashType: Int32] = [
      .MD2: CC_MD2_DIGEST_LENGTH,
      .MD4: CC_MD4_DIGEST_LENGTH,
      .MD5: CC_MD5_DIGEST_LENGTH,
      .SHA1: CC_SHA1_DIGEST_LENGTH,
      .SHA224: CC_SHA224_DIGEST_LENGTH,
      .SHA256: CC_SHA256_DIGEST_LENGTH,
      .SHA384: CC_SHA384_DIGEST_LENGTH,
      .SHA512: CC_SHA512_DIGEST_LENGTH,
    ]

    let funcMap: [HashType: (UnsafeRawPointer?, CC_LONG, UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>?] = [
      .MD2: CC_MD2,
      .MD4: CC_MD4,
      .MD5: CC_MD5,
      .SHA1: CC_SHA1,
      .SHA224: CC_SHA224,
      .SHA256: CC_SHA256,
      .SHA384: CC_SHA384,
      .SHA512: CC_SHA512,
      ]

    let length = Int(lengthMap[type]!)
    var digest = [UInt8](repeating: 0, count: Int(length))
      _ = data.withUnsafeBytes {
      (funcMap[type]!)($0.baseAddress, CC_LONG(data.count), &digest)
    }
    let res = digest.map { String(format: "%02x", $0) }.joined(separator: "")

    return res
  }

  var md2: String? {
    return hashing(.MD2)
  }

  var md4: String? {
    return hashing(.MD4)
  }

  var md5: String? {
    return hashing(.MD5)
  }

  var sha1: String? {
    return hashing(.SHA1)
  }
  
  var sha224: String? {
    return hashing(.SHA224)
  }

  var sha256: String? {
    return hashing(.SHA256)
  }

  var sha384: String? {
    return hashing(.SHA384)
  }

  var sha512: String? {
    return hashing(.SHA512)
  }

}



// MARK: - Transform (FullwidthHalfwidth)
public extension String {
  
  private func transformFullwidthHalfwidth(_ reverse: Bool) -> String {
    let str = NSMutableString(string: self) as CFMutableString
    CFStringTransform(str, nil, kCFStringTransformFullwidthHalfwidth, reverse)

    return str as String
  }

  var fullWidth: String {
    return transformFullwidthHalfwidth(true)
  }

  var halfWidth: String {
    return transformFullwidthHalfwidth(false)
  }
}



// MARK: - Transform (HiraganaKatakana)
public extension String {
  private func transformHiraganaKatakana(_ reverse: Bool) -> String {
    let str = NSMutableString(string: self) as CFMutableString
    CFStringTransform(str, nil, kCFStringTransformHiraganaKatakana, reverse)
    
    return str as String
  }
  
  var hiragana: String {
    return transformHiraganaKatakana(true)
  }
  
  var katakana: String {
    return transformHiraganaKatakana(false)
  }
}
