#!/usr/bin/env ruby
#
#get list of all local IP addresses

require 'socket'
puts Socket.ip_address_list
puts Socket.gethostname
