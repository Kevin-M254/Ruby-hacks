#!/usr/bin/env ruby
#
#lists all supported algorithms
require 'openssl'

puts OpenSSL::Cipher.ciphers
