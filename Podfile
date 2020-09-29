source 'https://github.com/CocoaPods/Specs.git'
source "https://github.com/aliyun/aliyun-specs.git"

platform :ios, '10.0'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

#flutter_application_path = 'flutter_lib'
#load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'AwesomeSwiftApp' do
#  install_all_flutter_pods(flutter_application_path)

  pod 'Log'
  pod 'Hero'
  pod 'SwiftTheme'
  pod 'R.swift', '5.0.0'
  pod 'SwiftLint', '0.31.0'
  pod 'Alamofire', '~> 5.2'
  pod 'SwiftDate', '~> 5.0'
  pod 'Localize-Swift', '~> 2.0'
  pod 'LookinServer',
    :configurations => ['Debug']
  pod 'FontAwesome.swift'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'RxFlow'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'SkeletonView'
  pod 'AlicloudAPM', '~> 1.0.0'
  pod 'AlicloudTLog', '~> 1.0.0'
  pod 'AlicloudCrash' , '~> 1.1.0'
  pod 'DoraemonKit/Core', '~> 3.0.2',
    :configurations => ['Debug'] #Required
  pod 'DoraemonKit/WithGPS', '~> 3.0.2',
    :configurations => ['Debug'] #Optional
  pod 'DoraemonKit/WithLoad', '~> 3.0.2',
    :configurations => ['Debug'] #Optional

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
