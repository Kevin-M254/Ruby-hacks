#!/usr/bin/env ruby
#
#usage: ./0-send_get_request [HOST] [SESSION_ID]

require 'net/http'

host      = ARGV[0] || "172.16.50.139"
session_id= ARGV[1] || "3c0e9a7edfa6682cb891f1c3df8a33ad"

def send_sqli(query)

  uri = URI.parse("https://#{host}/script/path/file.php?")
  uri.query = URI.encode_www_form({"var1"=> "val1",
                                   "var2"=> "val2",
                                   "var3"=> "val3"})

  http = Net::HTTP.new(uri.host, uri.post)
  http.use_ssl = true if uri.scheme == 'https'    #enable HTTPS

  request = Net:HTTP::Get.new(uri.request_uri)
  request["User-Agent"] = "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:39.0) Gecko/20100101 Firefox/39.0"
  request["Connection"] = "keep-alive"
  request["Accept-Language"] = "en-US,en;q=0.5"
  request["Accept-Encoding"] = "gzip, deflate"
  request["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
  request["PHPSESSID"] = session_id

  begin
    puts "Sending.."
    response = http.request(request).body
    puts response
  rescue Exception => e
    puts "[!] Failed!"
    puts e
  end

end
