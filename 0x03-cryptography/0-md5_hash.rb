#!/usr/bin/env ruby
#
#md5 hash

require 'digest'
puts Digest::MD5.hexdigest 'p@ssw0rd'
