Pod::Spec.new do |s|
  s.name             = 'Deeplinkable'
  s.version          = '0.1.0'
  s.summary          = 'A modular Deeplink SDK.'
  s.description      = 'The sdk create a way to map deeplinks easily, you just need to implement the Deeplinkable protocol, nothing more is necessary. You do not need to register and your deeplinks would be indexed, to be reached quickly. Deeplinkable can handle static and dynamic urls using regex expressions.'
  s.homepage         = 'https://github.com/allanragec/Deeplinkable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Allan Melo' => 'allanragec@gmail.com' }
  s.source           = { :git => 'https://github.com/allanragec/Deeplinkable.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'Deeplinkable/Classes/**/*'
end
