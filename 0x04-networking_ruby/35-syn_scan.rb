#!/usr/bin/env ruby

require 'nmap/program'

scan = Nmap::Program.scan do |nmap|
  nmap.syn_scan = true
  nmap.service_scan = true
  nmap.os_fingerprint = true
  nmap.xml = 'scan.xml'
  nmap.verbose = true

  nmap.ports = [20,21,22,23,25,80,110,443,512,522,8080,4444,3389]
  nmap.targets = '192.168.1.*'
end

puts scan
