#!/usr/bin/env ruby
#
# parses text separated by colon from a file
# usage:
#   ./7-colon_parser file.text
#

file = File.read(ARGV[0]).split("\n")
def parser(file)
  hash = {} # Datastore
  splitter = file.map { |line| line.split(':', 2) }
  splitter.each do |k, v|
    k.strip! # remove leading and trailing whitespaces
    v.strip! # remove leading and trailing whitespaces

    if hash[k] # if this key exists
      hash[k] << v # add this value to the key's array
    else
      hash[k] = [v] # create the new key and add an array contains this value
    end
  end

  hash # return the hash
end

parser(file).each {|k, v| puts "#{k}:\t#{v.join(', ')}"}
