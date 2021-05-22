Pod::Spec.new do |spec|
spec.name          = 'HelperKit'
spec.version       = '1.0.0'
spec.authors       = { 'Basheer Ahamed.S' => 'ssbasheerahamed@gmail.com' }
spec.summary       = 'Helper Extensions for iOS'
spec.license       = ''
spec.homepage      = 'https://github.com/MobileUtils'
spec.source        = { :git => 'https://github.com/MobileUtils/iOSHelperKit' }

spec.ios.deployment_target  = '9.0'

spec.source_files   = 'native/HelperKit/**/*.{swift,h}'
spec.framework      = 'UIKit'
end
