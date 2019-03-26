#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flurry'
  s.version          = '0.0.4'
  s.summary          = 'A Flutter plugin to use Flurry Analytics. This plugin logs sessions, crash detections, simple event logging, UserId.'
  s.description      = <<-DESC
A Flutter plugin to use Flurry Analytics. This plugin logs sessions, crash detections, simple event logging, UserId.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Flurry-iOS-SDK/FlurrySDK'

  s.ios.deployment_target = '8.0'
end

