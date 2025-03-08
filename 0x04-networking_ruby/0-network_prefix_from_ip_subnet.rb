#!/usr/bin/env ruby
#
#Calculating network prefix of an ip address from ip address
#and subnet mask

require 'ipaddr'
ip = IPAddr.new(ARGV[0])
network_prefix = ip.mask(ARGV[1])
puts network_prefix
