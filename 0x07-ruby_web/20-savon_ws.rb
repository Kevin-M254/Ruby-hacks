#!/usr/bin/env ruby

require 'savon'

url = "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL"
client = Savon.client(wsdl: url)

message = {'FromCurrency' => 'EUR', 'ToCurrency' => 'CAD'}
response = client.call(:conversion_rate, message: message).body

response[:conversion_rate_response][:conversion_rate_result]
