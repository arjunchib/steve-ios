use_frameworks!

target 'STEVE' do
  pod 'SnapKit'
  pod 'SKInnerShadowLayer'
  pod 'AlamofireImage'
  pod 'Socket.IO-Client-Swift'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
end
