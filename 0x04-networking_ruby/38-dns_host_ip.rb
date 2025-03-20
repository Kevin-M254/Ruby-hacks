#!/usr/bin/env ruby
#
#returns a list of all IPs

require 'resolv'
puts Resolv.getaddresses ARGV[0]
