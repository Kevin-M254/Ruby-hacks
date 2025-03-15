#!/usr/bin/env ruby
#
#basic ssh client which sends and executes commands on
#a remote system

require 'net/ssh'

@hostname = ARGV[0]
@username = ARGV[1]
@password = ARGV[2]
@cmd = ARGV[3]

begin
  ssh = Net:SSH.start(@hostname, @username, :password => @password)
  res = ssh.exec!(@cmd)
  ssh.close
  puts res
rescue
  puts "Unable to connect to #{@hostname} using #{@username}/#{@password}"
end
