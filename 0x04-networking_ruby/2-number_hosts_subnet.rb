#!/usr/bin/env ruby
#
#calculating the number of hosts in a subnet

require 'ipaddr'
ip = IPAddr.new("0.0.0.0/#{ARGV[0]}")
puts ip.to_range.count-2
