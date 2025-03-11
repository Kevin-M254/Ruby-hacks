#!/usr/bin/env ruby
#very basic gserver
require 'gserver'

class HelloServer < GServer
  def serve(io)
    io.puts("What's your name?")
    line = io.gets.chomp
    io.puts("Hello #{line}")
    self.stop if io.gets =~ /shutdown/    #stop server if you get shutdown string
  end
end

server = HelloServer.new(1234, '0.0.0.0') #start server on port 1234
server.audit = true   #enable logging
server.start          #start service
server.join
