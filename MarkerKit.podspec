Pod::Spec.new do |s|
  s.name             = 'MarkerKit'
  s.version          = '1.4.0'
  s.summary          = 'Lightweight and easy to use wrapper for Auto Layout Constraints'
  s.homepage         = 'https://github.com/pchelnikov/MarkerKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Pchelnikov' => 'm.pchelnikov@gmail.com' }
  s.source           = { :git => 'https://github.com/pchelnikov/MarkerKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/pchelnikov'
 
  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/MarkerKit.swift'
end