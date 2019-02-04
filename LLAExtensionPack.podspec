Pod::Spec.new do |s|
s.name         = "LLAExtensionPack"
s.version      = "1.0.7"
s.summary      = "Swift Extension Pack📦"
s.homepage     = "https://github.com/daisuke-t-jp/LLAExtensionPack"
s.screenshots  = "https://raw.githubusercontent.com/daisuke-t-jp/LLAExtensionPack/master/doc/header.png"
s.license      = "MIT"
s.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }

s.requires_arc = true
s.swift_version  = "4.2"
s.ios.deployment_target = "10.0"

s.source       = { :git => "https://github.com/daisuke-t-jp/LLAExtensionPack.git", :tag => s.version }
s.source_files  = 'LLAExtensionPack/*.{h,swift}', 'LLAExtensionPack/CoreAnimation/*.swift', 'LLAExtensionPack/CoreGraphics/*.swift', 'LLAExtensionPack/CoreLocation/*.swift', 'LLAExtensionPack/Foundation/*.swift', 'LLAExtensionPack/UIKit/*.swift'
end
