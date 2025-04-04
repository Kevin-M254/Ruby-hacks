#!/usr/bin/env ruby

require 'ntlm/http'

username = ARGV[0]
password = ARGV[1]
uri      = URI(ARGV[2])

http = http = Net::HTTP.new(uri.host, uri.port)
req  = Net::HTTP::Get.new(uri)
req.ntlm_auth username, password, uri
res  = http.request(req)

puts res.body
