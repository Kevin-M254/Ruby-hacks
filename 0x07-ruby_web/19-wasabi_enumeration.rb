#!/usr/bin/env ruby

require 'wasabi'

url = "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL"

document = Wasabi.document url
#parse document
document.parser
#SOAP XML
document.xml
#get endpoint
document.endpoint
#get target namespace
document.namespace
#enumerate SOAP operations
document.operations
#enumerate input parameters for particular operation
document.operation_input_parameters :conversion_rate
#enumerate all available currencies
document.parser.document.element_children[1].children[1].children[3].children[1].children.map {|c| c.attributes.values[0].to_s}
