# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scrape-geoip/version'

Gem::Specification.new do |gem|
  gem.name          = "scrape-geoip"
  gem.version       = Scrape::Geoip::VERSION
  gem.authors       = ["Travis Berry"]
  gem.email         = ["contact@travisberry.com"]
  gem.description   = %q{Scrape http://www.geoiptool.com/ for ip information}
  gem.summary       = %q{Scrape http://www.geoiptool.com/ for ip information}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri'
end
