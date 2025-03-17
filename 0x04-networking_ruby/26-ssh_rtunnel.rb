#!/usr/bin/env ruby
#
#Reverse tunnel

require 'net/ssh'

Net::SSH.start("MyIP", 'me', :password => '123123') do |ssh|

  ssh.forward.remote_to(3389, 'WebServer', 3333, '0.0.0.0')

  puts "[+] Starting SSH reverse tunnel"
  ssh.loop { true }
end
