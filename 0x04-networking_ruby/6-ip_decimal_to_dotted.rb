#!/usr/bin/env ruby
#
#convert ip decimal to dotted notation
require 'ipaddr'

puts [3232236159].pack('N').unpack('C4').join('.')
