Pod::Spec.new do |s|
  s.name         = "JSONRPCom"
  s.version      = "0.0.4"
  s.summary      = "JSON RPC implementation"

  s.homepage     = "https://github.com/andrewBatutin/JSONRPCom"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "andrewBatutin" => "abatutin@gmail.com" }

  s.source       = { :git => "https://github.com/andrewBatutin/JSONRPCom.git", :tag => s.version }
  s.source_files = 'JSONRPCom/**/*'
  s.framework    = 'Foundation'
  

  s.ios.deployment_target = '5.0' # there are usages of __weak
  s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.dependency 'Mantle'


end
