#!/usr/bin/env ruby

require 'net/ping'

@icmp = Net::Ping::ICMP.new(ARGV[0])
rtary = []
pingfalls = 0
repeat = 5
puts 'starting to ping'
(1..repeat).each do
  if @icmp.ping
    rtary << @icmp.duration
    puts "host replied in #{@icmp.duration}"
  else
    pingfalls += 1
    puts "timeout"
  end
end

avg = rtary.inject(0) {|sum, i| sum + i}/(repeat - pingfalls)
puts "Average round-trip is #{avg}\n"
puts "#{pingfalls} packets were dropped"
