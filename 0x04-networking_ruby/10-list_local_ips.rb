#!/usr/bin/env ruby
#
#get list of all local IP addresses

require 'socket'
puts Socket.ip_address_list.to_s
puts Socket.gethostname
