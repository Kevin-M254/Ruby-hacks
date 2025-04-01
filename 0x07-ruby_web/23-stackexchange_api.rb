#!/usr/bin/env ruby

require 'net/http'
require 'json'

json_res = JSON.parse(Net::HTTP.get(URI.parse "http://api.stackexchange.com/10.2/questions?site=stackoverflow"))

puts json_res
