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
  pod 'WechatOpenSDK'
  pod 'R.swift', '5.4.1-alpha.5'
  pod 'SwiftLint', '0.43.1'
  pod 'Alamofire', '~> 5.4'
  pod 'SwiftDate', '~> 6.3.1'
  pod 'Localize-Swift', '~> 3.2.0'
  pod 'LookinServer',
    :configurations => ['Debug']
  pod 'FontAwesome.swift'
  pod 'SwiftyJSON', '~> 5.0'
  pod 'RxFlow'
  pod 'RxSwift', '~> 6.2.0'
  pod 'RxCocoa', '~> 6.2.0'
  pod 'ParallaxHeader', '~> 3.0.0'
  pod 'SkeletonView'
  pod 'MJRefresh'
  pod 'SnapKit', '~> 5.0.0'
  pod 'Permission/Camera'
  pod 'Permission/Notifications'
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
  ## Fix for XCode 12.5
  find_and_replace("Pods/FBRetainCycleDetector/FBRetainCycleDetector/Layout/Classes/FBClassStrongLayout.mm",
    "layoutCache[currentClass] = ivars;", "layoutCache[(id<NSCopying>)currentClass] = ivars;")

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end

def find_and_replace(dir, findstr, replacestr)
  Dir[dir].each do |name|
      text = File.read(name)
      replace = text.gsub(findstr,replacestr)
      if text != replace
          puts "Fix: " + name
          File.open(name, "w") { |file| file.puts replace }
          STDOUT.flush
      end
  end
  Dir[dir + '*/'].each(&method(:find_and_replace))
end
