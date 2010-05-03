SPEC = Gem::Specification.new do |s|

  s.name             = "sinatra-jsonp"
  s.version          = "0.1"
  s.description      = "Simple extension to produce JSONP/JSON output"

  s.add_dependency "sinatra", "~> 1.0"
  s.add_dependency "json", "~> 1.4"

  s.authors          = ["Serg Podtynnyi"]
  s.email            = "serg.podtynnyi@gmail.com"
  s.files            = Dir["**/*.{rb,md}"]
  s.has_rdoc         = 'yard'
  s.homepage         = "http://github.com/shtirlic/#{s.name}"
  s.require_paths    = ["lib"]
  s.summary          = s.description
  
end
