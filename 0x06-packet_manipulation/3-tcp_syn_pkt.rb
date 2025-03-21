#!/usr/bin/env ruby

require 'packetfu'


def pkts
  #$config = PacketFu::Config.new(PacketFu::Utils.whoami?(:iface => "wlan0")).config

  #set interface
  $config = PacketFu::Config.new(:iface => "wlan0").config #use this if above line results in whoami error

  #Build TCP/IP
  #Build ethernet header

  pkt = PacketFu::TCPPacket.new(:config => $config, :flavor => Linux)

  pkt.eth_proto
  pkt.ip_v    = 4
  pkt.ip_hl   = 5
  pkt.ip_tos  = 0
  pkt.ip_len  = 20
  pkt.ip_id
  pkt.ip_frag = 0
  pkt.ip_ttl  = 115
  pkt.ip_proto= 6
  pkt.ip_sum
  pkt.ip_saddr= "2.2.2.2"
  pkt.ip-daddr= "10.20.50.45"

 #TCP  header
  pkt.payload        = "Hacked" 
  pkt.tcp_flags.ack  = 0
  pkt.tcp_flags.fin  = 0
  pkt.tcp_flags.psh  = 0
  pkt.tcp_flags.rst  = 0
  pkt.tcp_flags.syn  = 1
  pkt.tcp_flags.urg  = 0
  pkt.tcp_ecn        = 0
  pkt.tcp_win        = 8192
  pkt.tcp_hlen       = 5
  pkt.tcp_src        = 5555
  pkt.tcp_dst        = 4444
  pkt.recalc

  #end of build TCP/IP

  pkt_to_a = [pkt.to_s]
  return pkt_to_a
end


def scan
  pkt_array = pkts.sort_by{rand}
  puts "-" * " [-] Send Syn flag".length + "\n" + " [-] Send Syn flag" + "\n"

  inj = PacketFu::Inject.new(:iface => $config[:iface], :config => $config, :promisc => false)
  inj.array_to_wire(:array => pkt_array)      #send/inject the packet

  puts " [-] Done" + "\n" + "-" * " [-] Send Syn flag".length
end

scan
  
