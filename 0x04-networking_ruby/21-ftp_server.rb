#!/usr/bin/env ruby
#
#FTP server

require 'ftpd'

class Driver
  attr_accessor :path, :user, :pass
  def initialize(path)
    @path = path
  end

  def authenticate(user, password)
    true
  end

  def file_system(user)
    Ftpd::DiskFileSystem.new(@path)
  end

end

class FTPevil

  def initialize(path=".")
    @driver = Driver.new(File.expand_path(path))
    @server = Ftpd::FtpServer.new(@driver)
    configure_server
    print_connection_info
  end

  def configure_server
    @server.server_name = "Rubyfu FTP Server"
    @server.interface = "0.0.0.0"
    @server.port = 21
  end

  def print_connection_info
    puts "[+] Servername: #{@server.server_name}"
    puts "[+] Interface: #{@server.interface}"
    puts "[+] Port: #{@server.port}"
    puts "[+] Directory: #{@driver.path}"
    puts "[+] User: #{@driver.user}"
    puts "[+] Pass: #{@driver.pass}"
    puts "[+] PID: #{$$}"
  end

  def start
    @server.start
    puts "[+] FTP server started. (press CTRL+Z to stop it)"
    $stdout.flush
    begin
      loop{}
    rescue Interupt
      puts "\n[+] Closing FTP server."
    end
  end
end

if ARGV.size >= 1
  path  = ARGV[0]
else
  puts "[!] ./#{__FILE__} <PATH>"
  exit

end

FTPevil.new(path).start
