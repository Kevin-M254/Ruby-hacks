#!/usr/bin/env ruby
#
#
require 'socket'

socket = Socket.new(Socket::PF_PACKET, Socket::SOCK_RAW, 0x03)

puts "\n\n"
puts "		BSSID		|	SSID	"
puts "--------------------------*---------------"
while true
  # Capture the wire then convert it to hex to make it an array
  packet = socket.recvfrom(2048)[0].unpack('H*').join.scan(/../)
  if packet.size >= 62 && packet[9..12].join == "08000000" #make sure it's a beacon frame
    ssid_length = packet[61].hex - 1    #get ssid length
    ssid = [packet[62..(62 + ssid_length)].join].pack('H*') #get the ssid
    bssid = packet[34..39].join(':').upcase

    puts "#{bssid}" + "         " + "#{ssid}"
  end

end
