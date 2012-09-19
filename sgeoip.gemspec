# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sgeoip/version'

Gem::Specification.new do |gem|
  gem.name          = "sgeoip"
  gem.version       = Sgeoip::VERSION
  gem.authors       = ["Travis Berry"]
  gem.email         = ["contact@travisberry.com"]
  gem.description   = %q{Scrape http://www.geoiptool.com/ for ip information}
  gem.summary       = %q{Scrape http://www.geoiptool.com/}
  gem.homepage      = "https://github.com/ninetwentyfour/scrape-geoip"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri'
  gem.add_development_dependency 'rspec'
end