#!/usr/bin/env ruby
# extracts URLs from a string using regex

url_regex = /https?:\/\/[\S]+/

puts ARGV[0].scan(url_regex)
