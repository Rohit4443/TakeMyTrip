# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'TakeMyTrip' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TakeMyTrip

   pod 'SDWebImage'
   pod 'Socket.IO-Client-Swift', '~> 15.1.0'
   pod 'IQKeyboardManagerSwift'
   pod 'Kingfisher'
   pod 'Swifter', :git => "https://github.com/mattdonnelly/Swifter.git"
   pod 'GrowingTextView'
   pod 'SwiftyStoreKit'
   pod 'IQKeyboardManager'

  target 'TakeMyTripTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TakeMyTripUITests' do
    # Pods for testing
  end

 post_install do |installer|
     installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
         config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
       end
     end
   end


end
