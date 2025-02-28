#!/usr/bin/env ruby
# extracts URLs from a string using URI module
require 'uri'

puts URI.extract(ARGV[0], ["http" , "https"])
