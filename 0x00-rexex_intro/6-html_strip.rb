#!/usr/bin/env ruby
# extracts string from HTML

puts ARGV[0].gsub(/<.*?>/,'').strip
