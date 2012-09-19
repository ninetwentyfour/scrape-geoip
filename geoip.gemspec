# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geoip/version'

Gem::Specification.new do |gem|
  gem.name          = "geoip"
  gem.version       = Geoip::VERSION
  gem.authors       = ["Travis Berry"]
  gem.email         = ["contact@travisberry.com"]
  gem.description   = %q{Scrape http://www.geoiptool.com/ for ip information}
  gem.summary       = %q{Scrape http://www.geoiptool.com/}
  gem.homepage      = ""

  gem.files         = ["lib/geoip.rb"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri'
end