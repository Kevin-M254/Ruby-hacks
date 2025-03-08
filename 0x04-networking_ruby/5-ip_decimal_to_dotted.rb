#!/usr/bin/env ruby
#
#convert ip decimal to dotted notation
require 'ipaddr'
puts IPAddr.new(3232236159, Socket::AF_INET).to_s
