#!/usr/bin/env ruby

require 'net/dns'
resolver = Net::DNS::Resolver.start(ARGV[0])
puts resolver
