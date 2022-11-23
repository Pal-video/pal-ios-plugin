#
# Be sure to run `pod lib lint pal2.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'pal2'
  s.version          = '1.0.2'
  s.summary          = 'Your in-app friend that creates a real link with your users.'
  s.swift_version    = '5.7'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Your in-app friend that creates a real link with your users.
                       DESC

  s.homepage         = 'https://github.com/Pal-video/pal-ios-plugin'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'istornz' => 'iphoneretro@icloud.com' }
  s.source           = { :git => 'https://github.com/Pal-video/pal-ios-plugin.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'pal2/Classes/**/*'
  
  s.resources = "pal2/**/*.{ttf}"
  s.resource_bundles = {
    'pal2' => ['pal2/Classes/src/view/video_view/*.xib', 'pal2/Assets/assets/fonts/*.ttf', 'pal2/Assets/assets/images/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
  s.dependency 'Pulsator'
end
