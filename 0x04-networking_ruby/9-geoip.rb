#!/usr/bin/env ruby

require 'geoip'
ip = ARGV[0]
geoip = GeoIP.new('GeoLiteCity.dat')
geoinfo = geoip.country(ip).to_hash
puts "IP address:\t"   + geoinfo[:ip]
puts "Country:\t"      + geoinfo[:country_name]
puts "Country code:\t" + geoinfo[:country_code2]
puts "City name:\t"    + geoinfo[:city_name]
puts "Latitude:\t"     + geoinfo[:latitude]
puts "Longitude:\t"    + geoinfo[:longitude]
puts "Time zone:\t"    + geoinfo[:timezone]
