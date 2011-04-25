Gem::Specification.new do |s|

  s.name             = "sinatra-jsonp"
  s.version          = "0.3.1"
  s.description      = "JSONP output helper for Sinatra"

  s.add_dependency "sinatra", "~> 1.0"
  s.add_dependency "json_pure", "~> 1.4"

  s.add_development_dependency "rspec", "~> 2.3"
  s.add_development_dependency "rake"

  s.authors          = ["Serg Podtynnyi"]
  s.email            = "serg.podtynnyi@gmail.com"
  s.files            = Dir["**/*.{rb,md}"]+['Rakefile', 'LICENSE']
  s.has_rdoc         = 'yard'
  s.homepage         = "http://github.com/shtirlic/#{s.name}"
  s.require_paths    = ["lib"]
  s.summary          = s.description

end
