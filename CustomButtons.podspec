#
# Be sure to run `pod lib lint CustomButtons.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomButtons'
  s.version          = '0.1.1'
  s.summary          = 'CustomButtons is a library that used to create symple and customized button with Icon and Subtitle just by one initilizer.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'CustomButtons is a library that used to create symple and customized button with Icon and Subtitle just by one initilizer.'
                       DESC

  s.homepage         = 'https://github.com/mohammadakbari1993/CustomButtons'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mohammadakbari1993' => 'm.akbarii1993@gmail.com' }
  s.source           = { :git => 'https://github.com/mohammadakbari1993/CustomButtons.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/mohammadakbari-ios/'

  s.ios.deployment_target = '13.1'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "13.1"
  }
  
  # s.resource_bundles = {
  #   'CustomButtons' => ['CustomButtons/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
