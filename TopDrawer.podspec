Pod::Spec.new do |s|
  s.name                  = 'TopDrawer'
  s.version               = '0.1.3'
  s.summary               = 'A top drawer that can be pulled down over the screen.'
  s.homepage              = 'https://github.com/JUSTINMKAUFMAN/TopDrawer.git'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Justin Kaufman' => 'jmkauf@gmail.com' }
  s.source                = { :git => 'https://github.com/JUSTINMKAUFMAN/TopDrawer.git', :tag => s.version.to_s }
  s.swift_version         = '5.0'
  s.ios.deployment_target = '10.0'
  s.source_files          = 'TopDrawer/Classes/**/*'
  s.frameworks            = 'UIKit'
  s.description           = <<-DESC
  A top drawer that can be pulled up/down over the screen, written in Swift. Stays on top of the visible hierarchy. Does not prevent interaction with content underneath the drawer (as is the case with modal drawers).
DESC
end
