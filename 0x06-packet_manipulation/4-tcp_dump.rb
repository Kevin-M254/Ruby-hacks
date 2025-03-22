#!/usr/bin/env ruby

require 'packetfu'

capture = Packetfu::Capture.new(:iface=> "wlan0", :promisc => true, :start => true)
capture.show_live
