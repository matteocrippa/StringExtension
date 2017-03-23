Pod::Spec.new do |s|
  s.name             = 'StringExtension'
  s.version          = '0.2.0'
  s.summary          = 'A swift String extension.'

  s.description      = <<-DESC
Some useful String extension for Swift.
                       DESC

  s.homepage         = 'https://github.com/matteocrippa/StringExtension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matteo Crippa' => '' }
  s.source           = { :git => 'https://github.com/matteocrippa/StringExtension.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ghego20'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'StringExtension/Classes/**/*'

end
