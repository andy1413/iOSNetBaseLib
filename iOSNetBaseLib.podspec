#
# Be sure to run `pod lib lint iOSNetBaseLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iOSNetBaseLib'
  s.version          = '1.1'
  s.summary          = 'A short description of iOSNetBaseLib.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wangfangshuai/iOSNetBaseLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangfangshuai' => 'wangfangshuai@jd.com' }
  s.source           = { :git => 'https://github.com/wangfangshuai/iOSNetBaseLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'iOSNetBaseLib/Classes/**/*'
s.exclude_files = 'iOSNetBaseLib/Classes/JSONKit.{h,m}'
s.requires_arc = true

s.subspec 'JSONKit' do |ss|
ss.requires_arc = false
ss.public_header_files = 'iOSNetBaseLib/Classes/JSONKit.h'
ss.source_files = [
'iOSNetBaseLib/Classes/JSONKit.{h,m}'
]
ss.compiler_flags = '-fno-objc-arc'
end

  # s.resource_bundles = {
  #   'iOSNetBaseLib' => ['iOSNetBaseLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
s.dependency 'AFNetworking'
s.dependency 'MD5Digest'
s.dependency 'MBProgressHUD'
end
