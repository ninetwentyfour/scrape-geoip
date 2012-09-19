# Sgeoip

Scrape http://www.geoiptool.com/ for ip information

## Installation

Add this line to your application's Gemfile:

    gem 'sgeoip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sgeoip

## Usage

    require 'sgeoip'

	ip_info = Sgeoip::scrape('8.8.8.8')
	puts ip_info
	
## Expected output

    {"host"=>"google-public-dns-a.google.com", "country"=>" United States ", "country_code"=>"US (USA)", "region"=>"California", "city"=>"Mountain View", "zip"=>"94043"}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
