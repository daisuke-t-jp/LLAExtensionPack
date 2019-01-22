
Pod::Spec.new do |s|
s.name         = "LLAExtensionPack"
s.version      = "1.0.5"
s.summary      = "Swift Extension Pack With LLA Namespace 📦"
s.homepage     = "https://github.com/daisuke-t-jp/LLAExtensionPack"
s.screenshots  = "https://raw.githubusercontent.com/daisuke-t-jp/LLAExtensionPack/master/doc/header.png"
s.license      = "MIT"
s.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }
s.ios.deployment_target = "10.0"
s.platform       = :ios, "10.0"
s.swift_version  = "4.2"
s.source       = { :git => "https://github.com/daisuke-t-jp/LLAExtensionPack.git", :tag => "1.0.5" }
s.source_files  = 'LLAExtensionPack/*.{h,swift}', 'LLAExtensionPack/CoreAnimation/*.swift', 'LLAExtensionPack/CoreGraphics/*.swift', 'LLAExtensionPack/CoreLocation/*.swift', 'LLAExtensionPack/Foundation/*.swift', 'LLAExtensionPack/UIKit/*.swift'
end
