#!/usr/bin/env ruby

require 'socket'

client = TCPSocket.new('127.0.0.1', 9911) #client connects to server on port 9911
rhost = client.peeraddr.last
client.gets.chomp
cient.puts "Hi, TCP server #{rhost}"
client.close
