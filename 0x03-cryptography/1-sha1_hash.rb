#!/usr/bin/env ruby
#
#SHA1 hash

require 'digest'
puts Digest::SHA1.hexdigest 'p@ssw0rd'
