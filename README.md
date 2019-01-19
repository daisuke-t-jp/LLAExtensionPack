<img src="https://github.com/daisuke-t-jp/LLAExtensionPack/blob/master/doc/header.png" width="700"></br>
------
![Platform](https://img.shields.io/badge/Platform-iOS%2010.0+-blue.svg)
[![Language Swift%204.2](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/daisuke-t-jp/LLAExtensionPack.svg?branch=master)](https://travis-ci.org/daisuke-t-jp/LLAExtensionPack)

Swift Extension Pack With *"LLA"* Namespace.

### Carthage
`github "daisuke-t-jp/LLAExtensionPack"`


### Extensions
- Foundation
  - Int
  - String
  - Date
  - Locale
  - Bundle
  - URL
  - URLSession
- UIKit
  - UIColor
  - UIView


### Example

#### Swift code
```swift
import LLAExtensionPack


/**
 * String
 */
// Compare
"string".LLA.isEqual("String", caseInsensitive: true) // true

// Find
"string".LLA.hasPrefix("Str", caseInsensitive: true) // true
"string".LLA.hasSuffix("Ing", caseInsensitive: true) // true

// Substring
"string"[str.LLA.startIndex(0)!...str.LLA.startIndex(2)!] // "str"
"string".LLA.substring(NSMakeRange(1, 3)), "tri"

// Inspect
"1".LLA.isNumeric() // true
"ABC".LLA.isNumeric() // false

// Replace
"string".LLA.replace("str", replacement: "STR") // "STRing"
"string".LLA.replace("STR", replacement: "", caseInsensitive: true) // "ing"

// Remove
"string".LLA.remove("str") // "ing"
"string".LLA.remove("STR", caseInsensitive: true) // "ing"

// Encode
"abcABC1234/?-._~".LLA.urlEncoding() // "abcABC1234/?-._~"
":#[]@!$&'()*+,;=".LLA.urlEncoding() // "%3A%23%5B%5D%40%21%24%26%27%28%29%2A%2B%2C%3B%3D"

// Hash
"MD5".LLA.hashMD5() // MD5 Hash
"SHA1".LLA.hashSHA1() // SHA1 Hash

```