#!/usr/bin/env ruby
# extracts mac addresses from a string

mac_regex = /(?:[0-9A-f][0-9A-f][:\-]){5}[0-9A-F][0-9A-F]/i
puts ARGV[0].scan(mac_regex)
