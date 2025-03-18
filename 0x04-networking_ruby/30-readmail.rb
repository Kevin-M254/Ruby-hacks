#!/usr/bin/env ruby
#
#read email

require 'net/imap'

host = ARGV[0]
if host.nil?
  puts "[!] IP address missing \n/.#{__FILE__} [IP ADDRESS]\n\n"
  exit 0
end

username = ARGV[1] || "admin@attacker.zone"
password = ARGV[2] || "P@ssw0rd"

imap = Net::IMAP.new(host, 993, true, nil, false)
imap.login(username, password)
imap.select('INBOX')

mail_ids = imap.search([ALL])

#Read all emails
mail_ids.each do |id|
  envelope = imap.fetch(id, "ENVELOPE")[0].attr["ENVELOPE"]
  puts "[+] Reading message, Subject: #{envelope.subject}"
  puts imap.fetch(id, 'BODY[TEXT]')[0].attr['BODY[TEXT]']
end

# Delete all emails
# mail_ids.each do |id|
#   envelope = imap.fetch(id, "ENVELOPE")[0].attr["ENVELOPE"]
#   puts "[+] Deleting message, Subject: #{envelope.subject}"
#   imap.store(id, '+FLAGS', {:Deleted}) 
# end

imap.close
imap.logout
imap.disconnect
