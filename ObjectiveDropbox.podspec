#
# Be sure to run `pod lib lint ObjectiveDropbox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ObjectiveDropbox"
  s.version          = "1.0.0"
  s.summary          = "Unofficial Objective-C SDK for Dropbox HTTP API v2"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       ObjectiveDrobpoox contains all necessary classes for working with Dropbox using Objectve-C on iOS.
                       Cocoapods installation supports iOS 8.0 and above. If you need iOS 7 support, copy all ObjectiveDrobpox files to your project and add WebKit as optional framework.
                       DESC

  s.homepage         = "https://github.com/zlib/ObjectiveDrobpox"
  s.license          = 'MIT'
  s.author           = { "Mikhail Motyzhenkov" => "m.motyzhenkov@gmail.com" }
  s.source           = { :git => "https://github.com/zlib/ObjectiveDrobpox.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'WebKit'
end
