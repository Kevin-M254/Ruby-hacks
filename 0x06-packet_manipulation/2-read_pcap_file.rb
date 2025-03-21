#!/usr/bin/env ruby

require 'packetfu'
PacketFu::PcapFile.read_packets("file.pcap")
