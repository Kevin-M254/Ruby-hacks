#!/usr/bin/env ruby
#
#SHA2 hash
require 'digest/sha2'

password = 'p@assw0rd'
salt = rand(36**8).to_s(36)
shadow_hash = password.crypt("$6$" + salt)
puts shadow_hash
