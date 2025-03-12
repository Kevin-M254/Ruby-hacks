#!/usr/bin/env ruby

require 'socket'
client = UDPSocket.new
client.connect('localhost', 9911)
client.puts "Hi, UDP Server!", 0
server.recv(1024)
