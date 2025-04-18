#!/usr/bin/env ruby
#
# Find weak file permissions
#
require 'find'

path = ARGV[0]

search = Find.find(path)

def wx_file(search)
  search.select do |file|
    File.file?(file) && File.executable?(file) && File.writable?(file)
  end
end

puts wx_file search
