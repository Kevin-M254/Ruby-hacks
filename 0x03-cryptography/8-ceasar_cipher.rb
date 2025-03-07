#!/usr/bin/env ruby
#
#Caesar cipher

def caesar_cipher(string, shift=1)
  lowercase, uppercase = ('a'..'z').to_a, ('A'..'Z').to_a
  lower = lowercase.zip(lowercase.rotate(shift)).to_h
  upper = uppercase.zip(uppercase.rotate(shift)).to_h

  encrypter = lower.merge(upper)
  string.chars.map{|c| encrypter.fetch(c, c)}
end

string = ARGV[0]
1.upto(30) do |r|
  puts "ROT#{r} " + caesar_cipher(string, r).join
end
