#!/usr/bin/env ruby
#
#Dealing with ftp

require 'net/ftp'

ftp = Net::FTP.new('rubyfu.net', 'admin', 'p@ssw0rd')
ftp.welcome
ftp.system
ftp.chdir 'go/to/another/path'
ftp.pwd
ftp.ls
ftp.mkdir 'Rubyfu_backup'
ftp.size 'src.png'
ftp.get 'src.png', 'dest.png', 1024
ftp.put 'Linux.pdf'
ftp.rename 'Linux.pdf' 'Unix.pdf'
ftp.delete 'Unix.pdf'
ftp.quit
ftp.closed?
ftp.close
