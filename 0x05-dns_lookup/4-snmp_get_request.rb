#!/usr/bin/env ruby

require 'snmp'

#connect to snmp server
manager = SNMP::Manager.new(:host => ARGV[0])

#general info
puts "SNMP Version: " + manager.config[:version].to_s
puts "Community: " + manager.config[:community]
puts "Write Community: " + manager.config[:WriteCommunity]


#get hostname
hostname = manager.get("sysName.0").each_varbind.map {|vb| vb.value.to_s}
contact = manager.get("sysContact.0").each_varbind.map {|vb| vb.value.to_s}
location = manager.get("sysLocation.0").each_varbind.map {|vb| vb.value.to_s}

#take an array of OIDs
response = manager.get(["SysName.0", "SysContact.0", "sysLocation.0"])
response.each_varbind do |vb|
  puts vb.value.to_s
end
