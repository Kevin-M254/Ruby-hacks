#!/usr/bin/env ruby

require 'open-uri'
require 'json'
require 'net/http'

ip = JSON.parse(Net::HTTP.get(URI.parse 'https://api.ipify.org?format=json'))["ip"]
puts ip
