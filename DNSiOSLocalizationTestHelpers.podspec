Pod::Spec.new do |s|
  s.name         = "DNSiOSLocalizationTestHelpers"
  s.version      = "1.0.0"
  s.summary      = "A helper category on XCTestCase to make testing in different languages more pleasant."
  s.homepage     = "https://github.com/designatednerd/DNSiOSLocalizationTestHelpers"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = "Ellen Shapiro"
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/designatednerd/DNSiOSLocalizationTestHelpers.git", :tag => "v#{s.version}" }
  s.source_files = 'DNSCastroSegmentedControl/Library'
  s.requires_arc = true
end
