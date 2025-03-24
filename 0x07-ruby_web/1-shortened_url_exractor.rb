#!/usr/bin/env ruby
require 'net/http'
uri = ARGV[0]
loop do
  puts uri
  res = Net::HTTP.get_response URI uri
  if !res['location'].nil?
    uri = res['location']
  else
    break
  end
end
