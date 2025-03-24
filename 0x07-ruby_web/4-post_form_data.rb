#!/usr/bin/env ruby

require 'net/http'
require 'uri'

#Parsing the URL and instantiate http
uri = URI.parse("http://wwwx.cs.unc.edu/~jbs/aw-wwwp/docs/resources/perl/perl-cgi/programs/cgi_stdin.cgi")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true if uri.scheme == 'https'

#instantiate HTTP Post request
request = Net::HTTP::Post.new(uri.request_uri)

#Headers
request["Accept"] = "text/html,application/xhtml,application/xml;q=0.9,*/*;q=0.8"
request["User-Agent"] = "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0"
request["Referer"] = "http://www.cs.unc.edu/~jbs/resources/perl/perl-cgi/programs/form1-POST.html"
request["Connection"] = "keep-alive"
request["Accept-Language"] = "en-US,en;q=0.5"
request["Accept-Encoding"] = "gzip, deflate"
request["Content-Type"] = "application/x-www-form-urlencoded"

#Post body
request.set_form_data({
                        "name"           => "My title is here",
                        "textarea"       => "My grate message here",
                        "radiobutton"    => "middleun",
                        "checkedbox"     => "pizza",
                        "checkedbox"     => "hamburgers",
                        "checkedbox"     => "mashed potatoes",
                        "selectitem"     => "hamburgers",
                        "submitbutton"   => "Do it!"     
                      })

#receive response
response = http.request(request)

puts "Status code: " + response.code
puts "Response body: " + response.body
