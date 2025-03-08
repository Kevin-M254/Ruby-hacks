#!/usr/bin/env ruby
#
#convert subnet mask from dot-decimal notation to integer

require 'ipaddr'
subnet_mask = IPAddr.new(ARGV[0])
puts subnet_mask.to_i.to_s(2).count("1").to_s
