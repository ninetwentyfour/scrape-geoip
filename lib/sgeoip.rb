require "sgeoip/version"
require 'nokogiri'
require 'open-uri'

module Sgeoip
  def self.scrape(ip)
    url = "http://www.geoiptool.com/en/?IP=#{ip}"
    doc = Nokogiri::HTML(open(url))
    geoip = {  "host"         => doc.at_css(".tbl_style tr:nth-child(1) td.arial_bold").text,
               "country"      => doc.at_css(".tbl_style tr:nth-child(3) td.arial_bold").text,
               "country_code" => doc.at_css(".tbl_style tr:nth-child(4) td.arial_bold").text,
               "region"       => doc.at_css(".tbl_style tr:nth-child(5) td.arial_bold").text,
               "city"         => doc.at_css(".tbl_style tr:nth-child(6) td.arial_bold").text,
               "zip"          => doc.at_css(".tbl_style tr:nth-child(7) td.arial_bold").text
             }
    if geoip["host"].empty?
      geoip["error"] = "Results Not Found"
    end
    geoip
  end
end
