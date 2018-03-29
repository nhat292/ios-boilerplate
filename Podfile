# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def shared_pods

    # Network
    pod 'Moya/RxSwift', '~> 10.0'
    pod 'ObjectMapper', '~> 3.0'
    pod 'Moya-ObjectMapper/RxSwift', '~> 2.5'
    pod 'ReachabilitySwift', '~> 4.1'
    
    # Reactive
    pod 'RxSwift', '~> 4.0'
    pod 'RxCocoa', '~> 4.0'
    pod 'Action', '~> 3.0'
    pod 'RxSwiftExt', '~> 3.0'
    pod 'RxOptional', '~> 3.1'
    pod 'RxDataSources'

    # UI
    pod 'PINRemoteImage/PINCache', '=3.0.0-beta.13'

    # Chat
    # pod 'MessageKit' # A community-driven replacement for JSQMessagesViewController
    # pod 'NMessenger', '~> 1.0' # NMessenger is a eBay's chat opensource build on Texture

    # Database
    pod 'RealmSwift', '~> 3.0'
    pod 'RxRealm'

	# KeychainAccess
    pod 'KeychainAccess'

    # Style and conventions
    pod 'SwiftLint', '~> 0.23.0'
end

target 'Boilerplate' do
    use_frameworks!
    inhibit_all_warnings!

  # Pods for Boilerplate
    shared_pods

    post_install do |installer|
        installer.pods_project.targets.each do |target|
            if target.name == ‘RxSwift’
                target.build_configurations.each do |config|
                    if config.name == ‘Debug’
                        config.build_settings[‘OTHER_SWIFT_FLAGS’] ||= [‘-D’, ‘TRACE_RESOURCES’]
                    end
                end
            end
        end
    end

    target 'BoilerplateTests' do
        inherit! :search_paths
        # Pods for testing

    end

    target 'BoilerplateUITests' do
        inherit! :search_paths
        # Pods for testing

    end

end
							
