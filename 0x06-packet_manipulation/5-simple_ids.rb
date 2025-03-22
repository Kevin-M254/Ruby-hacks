#!/usr/bin/env ruby

require 'packetfu'

capture = PaketFu::Capture.new(:iface => "wlan0", :start => true, :filter => "ip")
loop do
  capture.stream.each do |pkt|
    packet = PacketFu::Packet.parse(pkt)
    puts "#{Time.now}: " + "Source IP: #{packet.ip_saddr}" + "-->" + "Destination IP : #{packet.ip_daddr}" if packet.payload =- /hacked/i
  end
end
