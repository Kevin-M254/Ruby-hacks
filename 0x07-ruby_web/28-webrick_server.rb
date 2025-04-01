#!/usr/bin/env ruby

require 'webrick'
server = WEBrick::HTTPServer.new :port => 8000, :DocumentRoot => '/var/www'
# Alternatively:
# WEBrick::Daemon.start
server.start
