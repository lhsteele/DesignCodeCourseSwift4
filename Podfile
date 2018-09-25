# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'DesignCodeAppAutoLayout' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DesignCodeAppAutoLayout
    pod 'Spring'
    
    post_install do |installer|
        installer.pods_project.build_configurations.each do |config|
            config.build_settings.delete('CODE_SIGNING_ALLOWED')
            config.build_settings.delete('CODE_SIGNING_REQUIRED')
        end
    end

#    post_install do |installer|
#        installer.pods_project.targets.each do |target|
#            if target.name == 'Spring'
#                target.build_configurations.each do |config|
#                    config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = ['$(inherited)', '/Applications/Xcode.app/Contents/Developer/Toolchains/Swift_2.3.xctoolchain/usr/lib/swift/iphonesimulator']
#                end
#            end
#        end
end
