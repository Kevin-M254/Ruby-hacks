#!/usr/bin/env ruby
#
#download file

require 'net/scp'

Net::SCP.download!(
                    "SSHServer",
                    "root",
                    "/root/", "/rubyfu/file.txt"
                    :ssh => { :password => "123123" }
                  )
