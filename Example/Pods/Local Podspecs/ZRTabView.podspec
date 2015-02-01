#
# Be sure to run `pod lib lint ZRTabView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZRTabView"
  s.version          = "0.1.1"
  s.summary          = "An easy lightweight tab bar controller that is scrollable and tab bar items are flexible with text sizes."
  s.homepage         = "https://github.com/raihan/ZRTabView"
  # s.screenshots     = "https://github.com/raihan/ZRTabView/blob/master/Example/ZRTabView/ScreenShot.png"
  s.license          = 'MIT'
  s.author           = { "Abdullah Md. Zubair" => "raihan.zbr@gmail.com" }
  s.source           = { :git => "https://github.com/raihan/ZRTabView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/raihan49', 'https://www.facebook.com/raihan.zbr'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'ZRTabView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
