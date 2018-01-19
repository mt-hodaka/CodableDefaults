Pod::Spec.new do |s|
  s.name         = "CodableDefaults"
  s.version      = "0.1"
  s.summary      = "Micro library for UserDefaults with Codable."
  s.homepage     = "https://github.com/mt-hodaka"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "mt-hodaka" => "mt.hodaka7@gmail.com" }
  s.social_media_url = "https://twitter.com/mt_hodaka"
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source = { :git => "https://github.com/mt-hodaka/CodableDefaults.git", :tag => "#{s.version}" }
  s.xcconfig = { "SWIFT_VERSION" => "4.0" }
  s.source_files  = "Sources/*.swift"
end
