Pod::Spec.new do |s|
  s.name             = "PaperTrailLumberjack"
  s.version          = "0.1.9"
  s.summary          = "A CocoaLumberjack logger to post logs to papertrailapp.com"
  s.description      = <<-DESC
A CocoaLumberjack logger to post log messages to papertrailapp.com.
                       DESC
  s.homepage         = "http://bitbucket.org/rmonkey/papertraillumberjack"
  s.license          = 'MIT'
  s.author           = { "George Malayil Philip" => "george.malayil@roguemonkey.in" }
  s.source = { :git => "https://bitbucket.org/paulcarpenter/papertraillumberjack-watchOS.git" , :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '6.0'
  s.osx.deployment_target = '10.10'
  s.default_subspec = 'Default'
  s.swift_version = '4.2'

  s.public_header_files = "Classes/RMPaperTrailLumberjack.h", "Classes/RMPaperTrailLogger.h", "Classes/RMSyslogFormats.h"
  s.source_files = 'Classes/*.{h,m}'

  s.ios.resource_bundle = { 'PaperTrailLumberjack' => 'Assets/*'}

  s.subspec 'Core' do |ss|
    ss.source_files = 'Classes/*.{h,m}'
    ss.dependency 'CocoaLumberjack', '~> 3.4'
    ss.dependency 'CocoaAsyncSocket', '~> 7.6'
  end

  s.subspec 'Default' do |ss|
    ss.dependency 'PaperTrailLumberjack/Core'
  end

  s.subspec 'Swift' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.watchos.deployment_target = '6.0'
    ss.osx.deployment_target = '10.10'
    ss.dependency 'PaperTrailLumberjack/Core'
    ss.dependency 'CocoaLumberjack/Swift', '~> 3.4'
  end
end
