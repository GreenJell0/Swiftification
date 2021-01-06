Pod::Spec.new do |s|
  s.name         = "Swiftification"
  s.version      = "12.0.0"
  s.summary      = "Swift extensions to make life more pleasant."
  s.authors      = 'Hilton Campbell', 'Stephan Heilner', 'Branden Russell', 'Nick Shelley', 'Rhett Rogers'
  s.homepage     = "https://github.com/GreenJell0/Swiftification"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.source       = { :git => "https://github.com/GreenJell0/Swiftification.git", :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '12.0'
  s.source_files = 'Sources/Swiftification/*.swift'
  s.requires_arc = true
  s.swift_version = '5.0'
  
  s.test_spec 'Tests' do |t|
    t.source_files = 'Tests/SwiftificationTests/*.{swift}'
  end
end
