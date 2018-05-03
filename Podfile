# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def shared_pods
    
    # Reactive
    pod 'RxSwift', '~> 4.0'
    pod 'Action', '~> 3.0'
    pod 'RxSwiftExt', '~> 3.0'
    pod 'RxOptional', '~> 3.1'

    # Style and conventions
    pod 'SwiftLint', '~> 0.23'
end

target 'Salon' do
    use_frameworks!
    inhibit_all_warnings!

    shared_pods
    pod 'PINRemoteImage/PINCache', '=3.0.0-beta.13'

    # Pods for Salon
    shared_pods

    post_install do |installer|
        installer.pods_project.targets.each do |target|
            if target.name == 'RxSwift'
                target.build_configurations.each do |config|
                    if config.name == 'Debug'
                        config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
                    end
                end
            end
        end
    end

    target 'SalonTests' do
        inherit! :search_paths
        # Pods for testing

    end

    target 'SalonUITests' do
        inherit! :search_paths
        # Pods for testing

    end
end

target 'Domain' do
    use_frameworks!
    inhibit_all_warnings!

    # Pods for Domain
    shared_pods

    target 'DomainTests' do
        inherit! :search_paths
    end
end

target 'NetworkPlatform' do
    use_frameworks!
    inhibit_all_warnings!

    # Pods for NetworkPlatform
    shared_pods
    pod 'Moya/RxSwift', '~> 10.0'
    pod 'ObjectMapper', '~> 3.0'
    pod 'Moya-ObjectMapper/RxSwift', '~> 2.5'
    pod 'ReachabilitySwift', '~> 4.1'

    # KeychainAccess
    pod 'KeychainAccess'

    target 'NetworkPlatformTests' do
        inherit! :search_paths
    end
end
