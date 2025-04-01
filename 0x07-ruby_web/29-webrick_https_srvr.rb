#!/usr/bin/env ruby

require 'webrick'
require 'webrick/https'

cert = [
  %w[CN localhost],
]

server = WEBrick::HTTPServer.new(:Port => 8000,
                                 :SSLEnable => true,
                                 :SSLCertName => cert,
                                 :DocumentRoot => '/var/www/')
server.start
