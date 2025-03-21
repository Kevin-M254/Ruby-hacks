#!/usr/bin/env ruby

require 'packetfu'
mac = PacketFu::Utils.arp(ARGV[0], :iface => "wlan0")
puts mac
