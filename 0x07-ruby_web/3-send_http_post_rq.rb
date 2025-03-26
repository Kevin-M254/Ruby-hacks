#!/usr/bin/env ruby
require 'net/http'

url = ARGV[0]
uri = URI.parse(url)
headers = 
  {
    'Referer' => url,
    'Cookie' =>  'TS9e4B=ae79efe; WSS_FullScrende=false; ASP.NET_SessionID=rxuvh3l5dam',
    'Connection' => 'keep-alive',
    'Content-Type' => 'application/x-www-form-urlencoded'
  }
post = File.read(post_file)      #Raw post body's data
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true if uri.scheme == 'https'  #enable https
request.body = post
response = http.request request
puts response.code
puts response.body
