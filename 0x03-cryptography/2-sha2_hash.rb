#!/usr/bin/env ruby
#
#SHA2 hash
require 'digest'

puts Digest::SHA2.new(bitlen = 256).hexdigest 'p@ssw0rd'
