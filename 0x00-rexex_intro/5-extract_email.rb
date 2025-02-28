#!/usr/bin/env ruby
# extracts emails from a string

email_regex = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
puts ARGV[0].scan(email_regex)
