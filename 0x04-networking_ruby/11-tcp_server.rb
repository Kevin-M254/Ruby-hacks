#!/usr/bin/env ruby
#
#server will access connection from one client and send message to it
#once onnected and then close the client and server connection

require 'socket'

server = TCPServer.new('0.0.0.0', 9911) #server binds on port 9911
client = server.accept                  #wait for client to connect
rhost = client.peeraddr.last            #returns remote aaddress_family, port, hostname, ip
client.puts "Hi TCP Client! #{rhost}"   #send message to client once it connects
client.gets.chomp                       #read incoming message from client
client.close                            #close the clients connection
sever.close                             #close the tcp server
