#!/usr/bin/env ruby
#
#calculating host part of an ip address from ip address and 
#subnet mask

require 'ipaddr'
ip = IPAddr.new(ARGV[0])
neg_subnet = ~(IPAddr.new("255.255.255.255").mask(ARGV[1]))
host = ip & neg_subnet
puts host
