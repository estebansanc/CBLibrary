#
# Be sure to run `pod lib lint CBLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.name             = 'CBLibrary'
  s.version          = '0.1.0'
  s.summary          = 'CrazyFarWay Base Library for iOS Mobile Development with UIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
CrazyFarWay Base Library for iOS Mobile Development with UIKit.
                       DESC

  s.homepage         = 'https://github.com/estebansanc/CBLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'estebansanc' => 'esteban.nicolas.sanc@gmail.com' }
  s.source           = { :git => 'https://github.com/estebansanc/CBLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'CBLibrary/Utils/**/*'
  
  # s.resource_bundles = {
  #   'CBLibrary' => ['CBLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  # ――― Dependencies ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.dependency 'SkeletonView', '~> 1.26.0'
end
