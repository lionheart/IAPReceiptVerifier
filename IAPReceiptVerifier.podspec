Pod::Spec.new do |s|
  s.name             = 'IAPReceiptVerifier'
  s.version          = '0.1.0'
  s.summary          = 'Easily validate App Store receipts for In-App Purchases'

  s.description      = <<-DESC
IAPReceiptVerifier uses StoreKit and a web service to make it easy to check for valid In-App Purchase receipts.
                       DESC

  s.homepage         = 'https://github.com/lionheart/IAPReceiptVerifier'
  s.license          = 'Apache 2.0'
  s.author           = { 'Dan Loewenherz' => 'dan@lionheartsw.com' }
  s.source           = { :git => 'https://github.com/lionheart/IAPReceiptVerifier.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lionheartsw'

  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.0'
  }

  s.ios.deployment_target = '10.0'
  s.source_files = 'IAPReceiptVerifier/Classes/**/*'
  s.frameworks = 'UIKit', 'StoreKit'
end
