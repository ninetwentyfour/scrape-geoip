require "sgeoip/version"
require 'nokogiri'
require 'open-uri'
require 'active_support'
require 'geo_location'

module Sgeoip
  def self.scrape(ip)
    geoip = geoiptool(ip)
    if geoip["error"]
      geoip = hostip(ip)
    end
    geoip
  end
  
  def self.geoiptool(ip)
    url = "http://www.geoiptool.com/en/?IP=#{ip}"
    begin
      doc = Nokogiri::HTML(open(url))
      geoip = {  "host"         => doc.at_css(".tbl_style tr:nth-child(1) td.arial_bold").text,
                 "country"      => doc.at_css(".tbl_style tr:nth-child(3) td.arial_bold").text.to_s[1..-2], #strip extra spaces
                 "country_code" => doc.at_css(".tbl_style tr:nth-child(4) td.arial_bold").text,
                 "region"       => doc.at_css(".tbl_style tr:nth-child(5) td.arial_bold").text,
                 "city"         => doc.at_css(".tbl_style tr:nth-child(6) td.arial_bold").text,
                 "zip"          => doc.at_css(".tbl_style tr:nth-child(7) td.arial_bold").text
               }
    rescue Exception => e
      geoip = { "host" => ""}
    end
    if geoip["host"].empty?
      geoip["error"] = "Results Not Found"
    end
    geoip
  end
  
  def self.hostip(ip)
    begin
      GeoLocation::use = :hostip
      location = GeoLocation.find(ip)
      geoip = {  "host"         => "N/A",
                 "country"      => location[:country],
                 "country_code" => location[:country_code],
                 "region"       => "N/A",
                 "city"         => location[:city],
                 "zip"          => "N/A"
               }
    rescue Exception => e
      geoip = { "host" => ""}
    end
    if geoip["host"].empty?
      geoip["error"] = "Results Not Found"
    end
    geoip
  end
  
end
