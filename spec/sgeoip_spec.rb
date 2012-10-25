require 'spec_helper'

describe Sgeoip do
  it 'should return correct info for ip' do
    ip_info = Sgeoip::scrape('8.8.8.8')

    ip_info["host"].should == "google-public-dns-a.google.com"
    ip_info["country"].should == "United States"
    ip_info["country_code"].should == "US (USA)"
    ip_info["region"].should == "California"
    ip_info["city"].should == "Mountain View"
    ip_info["zip"].should == "94043"
    ip_info["error"].should be_nil
  end
  
  it 'should return correct info for ip using geoip tool' do
    ip_info = Sgeoip::geoiptool('8.8.8.8')

    ip_info["host"].should == "google-public-dns-a.google.com"
    ip_info["country"].should == "United States"
    ip_info["country_code"].should == "US (USA)"
    ip_info["region"].should == "California"
    ip_info["city"].should == "Mountain View"
    ip_info["zip"].should == "94043"
    ip_info["error"].should be_nil
  end
  
  it 'should return correct info for ip using hostip' do
    ip_info = Sgeoip::hostip('8.8.8.8')

    ip_info["host"].should == "N/A"
    ip_info["country"].should == "United States"
    ip_info["country_code"].should == "US"
    ip_info["region"].should == "N/A"
    ip_info["city"].should == "Mountain View"
    ip_info["zip"].should == "N/A"
    ip_info["error"].should be_nil
  end
  
  it 'should return an error for a bad ip' do
    ip_info = Sgeoip::scrape('1.c.aa.p/')
    
    ip_info["error"].should == "Results Not Found"
  end
  
  it 'should strip and special non utf-8 characters' do
    ip_info = Sgeoip::scrape('189.62.243.113')

    ip_info["host"].should == "bd3ef371.virtua.com.br"
    ip_info["country"].should == "Brazil"
    ip_info["country_code"].should == "BR (BRA)"
    ip_info["region"].should == "Sao Paulo"
    ip_info["city"].should == "So Paulo"
    ip_info["error"].should be_nil
  end
  
end