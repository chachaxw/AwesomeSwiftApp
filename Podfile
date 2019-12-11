source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'AwesomeSwiftApp' do

  pod 'R.swift', '5.0.0'
  pod 'SwiftLint', '0.31.0'
  pod 'AFNetworking', '~> 3.0'

  target 'AwesomeSwiftAppTests' do
    inherit! :search_paths
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
