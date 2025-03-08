#!/usr/bin/env ruby
#
#convert dotted notation to decimal

require 'ipaddr'
puts IPAddr.new(ARGV[0]).to_i
