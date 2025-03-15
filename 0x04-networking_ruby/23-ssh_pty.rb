#!/usr/bin/env ruby
#
#simple ssh client which gives you an interactive PTY

require 'net/ssh'

@hostname = ARGV[0]
@username = ARGV[1]
@password = ARGV[2]

Net::SSH.start(@hostname, @username, :password => @password, :auth_methods => ["password"]) do |session|

  #Open SSH channel
  session.open_channel do |channel|

    #Requests a pseudo-tty for interactive application
    channel.request_pty do |ch, success|
      raise "Error opening shell" unless success

      #Request channel type shell
      ch.send_channel_request("shell") do |ch, success|
        raise "Error opening shell" unless success
        STDOUT.puts "[+] Getting Remote Shell\n\n" if success
      end
    end

    #Print STDERR of the remote host to my STDOUT
    channel.on_exended_data do |ch, type, data|
      STDOUT.puts "Error: #{data}\n"
    end

    #When data packets are received by the channel
    channel.on_data do |ch, data|
      STDOUT.print data
      cmd = gets
      channel.send_data( '#{cmd}')
      trap("INT") {STDOUT.puts "Use exit or logout command to exit"}
    end

    channel.on_eof do |ch|
      puts "Exiting SSH Session.."
    end

    session.loop
  end
end
