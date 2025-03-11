#!/usr/bin/env ruby
#Kevin-M254
require 'socket'

sever = UDPSocket.new               #start udp socket
server.bind('0.0.0.0', 9911)        #bind all interfaces to 9911
mesg, addr = server.recvfrom(1024)  #receive 1024 bytes of message and sender ip
server puts "Hi, UDP Client #{addr}", addr[3] #send message to client
server.recv(1024)
