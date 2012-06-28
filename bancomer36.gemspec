# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bancomer36/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hector Sansores"]
  gem.email         = ["hector.sansores@virtus.com.mx"]
  gem.description   = %q{Bancomer 36 check digit}
  gem.summary       = %q{Calculates check digit according to Bancomer 36 algorithm}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bancomer36"
  gem.require_paths = ["lib"]
  gem.version       = Bancomer36::VERSION
end
