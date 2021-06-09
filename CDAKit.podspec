#
#  CDAKit
#
#  CDAKit for iOS, the Open Source Clinical Document Architecture Library with HealthKit Connectivity
#

Pod::Spec.new do |s|
  s.name         = "CDAKit"
  s.version      = "1.2.0"
  s.summary      = "CDAKit for iOS, the Open Source Clinical Document Architecture Library with HealthKit Connectivity."
  s.description  = <<-DESC
    Swift framework port of the the Ruby Health-Data-Standards GEM's C32 and C-CDA import and export functionality. Allows for bridging between CDA and HealthKit so you can integrate with an Electronic Medical Records system.
  DESC

  s.homepage     = "https://github.com/ewhitley/CDAKit"
  s.license      = 'Apache 2'
  s.authors      = { "Eric Whitley" => "cdakit@gmail.com" }
  s.source       = { :git => "https://github.com/ewhitley/CDAKit.git", :tag => s.version.to_s }
  s.documentation_url = "http://ewhitley.github.io/CDAKit"

  s.platform     = :ios, '11.0'
  s.ios.deployment_target = "11.0"
  s.requires_arc = true
  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2'
  }

  s.source_files = 'CDAKit/**/*.swift'
  s.resource_bundles = {
    'CDAKit' => [
      'CDAKit/**/*.mustache',
      'CDAKit/**/CDAKitDefaultHealthKitTermMap.plist',
      'CDAKit/**/CDAKitDefaultSampleTypeIdentifierSettings.plist'
    ]
  }
  s.frameworks = 'HealthKit'
  s.dependency 'GRMustache.swift', '3.0.1'
  s.dependency 'Fuzi', '~> 3.1.3'
  s.dependency 'Try', '~> 2.1.1'
end
