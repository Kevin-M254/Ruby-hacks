#!/usr/bin/env ruby
#
#generate windows LM password hash
require 'openssl'

def split7(str)
  str.scan(/.{1,7}/)
end

def gen_keys(str)
  split7(str).map do |str7|

    bits = split7(str7.unpack("B*")[0]).inject('') do |ret, tkn|
      ret += tkn + (tkn.gsub('1', '').size % 2).to_s
    end

    [bits].pack("B*")
  end
end

def apply_des(plain, keys)
  dec = OpenSSL::Cipher::DES.new
  keys.map {|k|
    dec.key = k
    dec.encrypt.update(plain)
  }
end

LM_MAGIC = "KGS!@\#$%"
def lm_hash(password)
  keys = gen_keys password.upcase.ljust(14, "\0")
  apply_des(LM_MAGIC, keys).join
end

puts lm_hash "p@ssw0rd"
