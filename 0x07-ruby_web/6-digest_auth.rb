#!/usr/bin/env ruby

require 'ntlm/http'
require 'net/http/digest_auth'

uri          = URI(ARGV[0])
uri.user     = ARGV[1]
uri.password = ARGV[2]

http = Net::HTTP.new(uri.host, uri.port)
digest_auth = Net::HTTP::DigestAuth.new
req = Net::HTTP::Get.new(uri)
auth = digest_auth.auth_header uri, res['www-authenticate'], 'GET'
req.add_field 'Authorization', auth
res = http(request)

puts res.body
