#!/usr/bin/env ruby
#
#AES encryption
require 'openssl'

data = "Secret mission: Go hack the world"

#setup cipher
cipher = OpenSSL::Cipher::AES.new('256-CBC')

cipher.encrypt
key = cipher.random_key #if hardcoded, it must be 256 bit length
iv = cipher.random_iv   #generate initial vector
encrypt = cipher.update(data) + cipher.final
puts encrypt
