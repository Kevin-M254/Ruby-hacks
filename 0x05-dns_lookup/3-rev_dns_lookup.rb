#!/usr/bin/env ruby

require 'net/dns'

resolver = Net::DNS::Resolver.new
query = resolver.query(ARGV[0], Net::DNS::PTR)
puts query
