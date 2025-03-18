#!/usr/bin/env ruby
#
#smtp send email

require 'net/smtp'
require 'date'

def send_mail(smtpsrv, username, password, frmemail, dstemail)

  msg = "From: #{frmemail}\n"
  msg += "To: #{dstemail}\n"
  msg += "Date: #{date}\n"
  msg += "Subject: Email Subject\n"
  msg += "Content-type: text/html\n\n"
  msg += "<strong>Winter is coming<br>Hi Jon Snow, Please click to win"

  begin
    Net::SMTP.start(smtpsrv, 25, 'localhost', username, password, :login) do |smtp|
      smtp.send_message msg, frmemail, dstemail
    end
    puts "[+] Email has been sent successfully!"
  rescue Exception => e
    puts "[!] Failed to send the email!"
    puts e
  end

end

smtpsrv  = ARGV[0]
username = "admin@attacker.zone"
password = "P@ssw0rd"
frmemail = "admin@attacker.zone"
dstemail = "JonSnow@victim.com"
date     = DateTime.now

smtpsrv = ARGV[0]
if smtpsrv.nil?
  puts "[!] IP address missing \n ./#{__FILE__} [IP ADDRESS]\n"
  exit 0
end

send_mail smtpsrv, username, password, frmemail, dstemail
