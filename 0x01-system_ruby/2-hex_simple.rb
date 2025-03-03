#!/usr/bin/env ruby
#
# simple file to hex converter script
#
file_name = ARGV[0]

file = File.open(file_name , 'rb')
file2hex = file.read.each_byte.map { |b| '\x%02x' % b }.join  # b.to_s(16).rjust(2, '0')

puts file2hex
