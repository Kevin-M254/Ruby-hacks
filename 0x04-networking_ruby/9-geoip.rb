#!/usr/bin/env ruby

require 'geoip'
ip = ARGV[0]
geoip = GeoIP.new('maxmind.dat')
geoinfo = geoip.country(ip).to_h

puts "IP address:\t"   + geoinfo[:ip].to_s
puts "Country:\t"      + geoinfo[:country_name].to_s
puts "Country code:\t" + geoinfo[:country_code2].to_s
puts "City name:\t"    + geoinfo[:city_name].to_s
puts "Latitude:\t"     + geoinfo[:latitude].to_s
puts "Longitude:\t"    + geoinfo[:longitude].to_s
puts "Time zone:\t"    + geoinfo[:timezone].to_s
