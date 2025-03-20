#!/usr/bin/env ruby
#
#returns hostnames

require 'resolv'
puts Resolv.getnames ARGV[0]
