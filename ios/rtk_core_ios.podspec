#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint realtimekit_core_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'realtimekit_core_ios'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  s.dependency 'AmazonIVSPlayer', '~> 1.19.0'
  s.dependency 'RealtimeKitFlutterCoreKMM', '~> 0.1.3'
  s.resource_bundles = {'rtk_core_ios_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
    
  # Flutter.framework does not contain a i386 slice.
  s.swift_version = '5.0'
end
