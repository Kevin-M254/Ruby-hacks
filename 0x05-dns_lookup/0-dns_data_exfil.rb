#!/usr/bin/env ruby
#
#

require 'socket'

if ARGV.size < 1
  puts "[!] sudo ./#{__FILE__} <FILENAME>"
  exit
else
  file = ARGV[0]
end

#open UDP socket and bind it to socket 53
udpsoc = UDPSocket.new
udpsoc.bind('0.0.0.0', 9911)

begin

  data     = ''
  data_old = ''

  loop do
    response = udpsoc.recvfrom(1000)
    response = response[0].force_encoding("ISO-8859-1").encode("utf")
    data = response.match(/[^<][a-f0-9]([a-f0-9]).*[a-f0-9]([a-f0-9])/i).to_s

    #write received data to file
    File.open(file, 'a') do |d|
      d.write [data].pack("H*") unless data == data_old
      puts data unless data == data_old
    end

    data_old = data
  end

rescue Exception => e
  puts e
end
