#!/usr/bin/env ruby

require 'packetfu'

info = PacketFu::Utils.whoami?(:iface => ARGV[0])
puts info
