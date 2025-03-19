#!/usr/bin/env ruby

require 'nmap/program'

Nmap::Program.scan do |nmap|

  #target
  nmap.targets = '192.168.0.1'
  nmap.verbose = true
  nmap.show_reason = true

  #port scanning techniques
  nmap.syn_scan = true    #nmap.all

  #service/version detection
  nmap.service_scan = true
  nmap.os_fingerprint = true
  nmap.version_all  = true

  #script scanning
  nmap.script = "all"

  nmap.all_ports        #nmap.ports = (0..65535).to_a

  #firewalls/IDS evasion and spoofing
  nmap.decoys = ["google.com","yahoo.com","hotmail.com","facebook.com"]
  nmap.spoof_mac = "00:11:22:33:44:55"
  #timing and perfomance
  nmap.min_parallelism = 30
  nmap.max_parallelism = 130

  #scan outputs
  nmap.output_all = 'ruby_scan'

end
