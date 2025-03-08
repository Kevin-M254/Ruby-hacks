#!/usr/bin/env ruby
#
#check whether an ip address belongs to a subnet or not

require 'ipaddr'
net=IPAddr.new("#{ARGV[0]}/#{ARGV[1]}")
puts net === ARGV[2]
