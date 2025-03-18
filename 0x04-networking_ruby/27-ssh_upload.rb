#!/usr/bin/env ruby
#
#upload file

require 'net/scp'

Net::SCP.upload!(
                  "SSHServer",
                  "root",
                  "/rubyfu/file.txt", "/root/",
                  #:recursive => true,    #Uncomment for recursion
                  :ssh => { :password => "123123" }
                )
