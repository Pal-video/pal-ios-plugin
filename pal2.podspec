#
# Be sure to run `pod lib lint pal2.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'pal2'
  s.version          = '1.0.6'
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

  s.source_files = 'pal2/Classes/**/*', 'pal2/Assets/fonts/*.{ttf}', 'pal2/Assets/Media.xcassets'
  
  # s.resources = 'pal2/Assets/fonts/*.{ttf}', 'pal2/Assets/Media.xcassets', 'pal2/Classes/src/view/video_view/*.xib'
  s.resource_bundles = {
    'Pal2Ressources' => ['pal2/Assets/fonts/Inter-Bold.ttf', 'pal2/Assets/fonts/Inter-Regular.ttf', 'pal2/Assets/Media.xcassets']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
  s.dependency 'Pulsator'
end
