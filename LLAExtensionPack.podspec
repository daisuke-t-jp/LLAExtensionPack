Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "LLAExtensionPack"
  spec.version      = "1.0.8"
  spec.summary      = "Swift Extension Pack📦"

  spec.description  = <<-DESC
                   Swift Extension Pack 📦
                   DESC

  spec.homepage     = "https://github.com/daisuke-t-jp/LLAExtensionPack"
  spec.screenshots  = "https://raw.githubusercontent.com/daisuke-t-jp/LLAExtensionPack/master/doc/header.png"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.ios.deployment_target = "10.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/daisuke-t-jp/LLAExtensionPack.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "LLAExtensionPack/*.{swift}", "LLAExtensionPack/CoreAnimation/*.swift", "LLAExtensionPack/CoreGraphics/*.swift", "LLAExtensionPack/CoreLocation/*.swift", "LLAExtensionPack/Foundation/*.swift", "LLAExtensionPack/UIKit/*.swift"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.swift_version = "5.0"
  spec.requires_arc = true

end
