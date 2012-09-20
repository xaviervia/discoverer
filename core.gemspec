# -*- encoding: utf-8 -*-
require File.expand_path('../lib/core/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Xavier Via"]
  gem.email         = ["xavierviacanel@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.add_dependency 'virtus'
  
  gem.add_development_dependency 'rspec'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "core"
  gem.require_paths = ["lib"]
  gem.version       = Core::VERSION
end