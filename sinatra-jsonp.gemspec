Gem::Specification.new do |s|

  s.name             = "sinatra-jsonp"
  s.version          = "0.4.4"
  s.description      = "JSONP output helper for Sinatra"

  s.add_dependency "sinatra", ">= 1.0"
  s.add_dependency "multi_json", "~> 1.8"

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rake', '>= 0'
  s.add_development_dependency 'sinatra-contrib', '>= 1.0'
  s.add_development_dependency 'test-unit', '~> 3.0.9'
  s.add_development_dependency 'rack-test', '~> 0.7.0'

  s.authors          = ["Serg Podtynnyi"]
  s.email            = "serg.podtynnyi@gmail.com"
  s.files            = Dir["**/*.{rb,md}"]+['Rakefile', 'LICENSE']
  s.homepage         = "http://github.com/shtirlic/#{s.name}"
  s.license          = "MIT"
  s.require_paths    = ["lib"]
  s.summary          = s.description

end
