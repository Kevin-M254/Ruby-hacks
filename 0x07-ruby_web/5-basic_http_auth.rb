#!/usr/bin/env ruby

require 'net/http'

username = ARGV[0]
password = ARGV[1]
uri      = URI(ARGV[2])

http = Net::HTTP.new(uri.host, uri.port)
req  = Net::HTTP::Get.new(uri)
req.basic_auth username, password
res  = http.request(req)

puts res.body
