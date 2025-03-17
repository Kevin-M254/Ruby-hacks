#!/usr/bin/env ruby
#
#Run it on server
require 'net/ssh'

net::SSH.start("127.0.0.1", 'root', :password => '123123') do |ssh|
  ssh.forward.local('0.0.0.0', 3333, "WebServer", 3389)   #connect to the SSH server on port 3333: rdesktop WebServer:3333

  puts "[+] Starting SSH forward tunnel"
  ssh.loop { true }
end
