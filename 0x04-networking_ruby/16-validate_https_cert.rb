#!/usr/bin/env ruby
#
#certificate validation

require 'open-uri'
require 'uri'
require 'openssl'

def validate_https_cert(target) begin
    open("https://www.#{target}")
    puts '[+] Valid SSL Certificate!'
  rescue OpenSSL::SSL::SSLError
    puts '[+] Invalid SSL Certificate'
  end
end

good_ssl = 'google.com'
bad_ssl  = 'expired.badssl.com'

validate_https_cert(good_ssl)
validate_https_cert(bad_ssl)
