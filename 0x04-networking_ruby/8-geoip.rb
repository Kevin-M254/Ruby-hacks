#!/usr/bin/env ruby

require 'maxmind/geoip2'


# This reader object should be reused across lookups as creation of it is

# expensive.

reader = MaxMind::GeoIP2::Reader.new('~/path/to/maxmind-database.mmdb')


record = reader.city(ARGV[0])


puts record.country.iso_code
