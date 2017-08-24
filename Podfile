# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


def rx_swift
    pod 'RxSwift', '~> 3.0'
end

def rx_cocoa
    pod 'RxCocoa', '~> 3.0'
end

def firebase
    pod 'Firebase/Core'
    pod 'Firebase'
    pod 'Firebase/Auth'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
end

def test_pods
    pod 'RxTest', '~> 3.0'
    pod 'RxBlocking', '~> 3.0'
    pod 'Nimble'
end



target 'Domain' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  # Pods for Domain

  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
  end

end


target 'Network' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    pod 'Alamofire'
    pod 'RxAlamofire'
    pod 'ObjectMapper'
    pod 'AlamofireObjectMapper'
    
    end

target 'LogBook' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_cocoa
  firebase
  
  pod 'Bolts-Swift'
  # Pods for LogBook

  target 'LogBookTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'LogBookUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
