# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bcm2835/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Joshua Nussbaum"
  gem.email         = "joshnuss@gmail.com"
  gem.description   = %q{Bindings for libbcm2385}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bcm2835"
  gem.require_paths = ["lib"]
  gem.version       = Bcm2835::VERSION

	gem.add_dependency "ffi"
	gem.add_development_dependency "rspec"
end
