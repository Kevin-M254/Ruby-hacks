#!/usr/bin/env ruby

require 'nmap'
scan = Nmap::Program.scan(:target => '192.168.0.15', :verbose => true)
puts scan
