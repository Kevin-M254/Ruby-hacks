#!/usr/bin/env ruby

require './packetfu-shell.rb'
ifconfig = PacketFu::Utils.ifconfig("wlp2s0")
puts ifconfig[:iface]
puts ifconfig[:ip_saddr]
puts ifconfig[:eth_saddr]
