# -*- encoding: utf-8 -*-
require File.expand_path('../lib/leeno/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["soplana"]
  gem.email         = ["sonosheet.jp@gmail.com"]
  gem.description   = %q{Is a gem to use the Leeno API}
  gem.summary       = %q{leeno}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "leeno"
  gem.require_paths = ["lib"]
  gem.version       = Leeno::VERSION

  gem.add_dependency "faraday", "~>0.8.0"
  gem.add_dependency "faraday_middleware", "~>0.8.7"

end
