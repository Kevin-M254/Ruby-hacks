#!/usr/bin/env ruby

require 'net/dns'
mx = Net::DNS::Resolver.start(ARGV[0], Net::DNS::MX).answer
puts mx
