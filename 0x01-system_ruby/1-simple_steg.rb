#!/usr/bin/env ruby
# Kevin_M
# simple script to hide a file file.pdf in an image img.png & write 
# it to steg.png
# then recover the file.pdf from steg.png to hola.pdf
#

file1, file2 = ARGV
sec_file = File.read file1  # 'file.pdf'
nor_file = File.read file2  # 'image.png'
sep = '*-----------------------*'
one_file = [nor_file, sep, sec_file]

# write sec_file, sep, nor_file into steg.png
File.open("steg.png", 'wb') do |stg|
  one_file.each do |f|
    stg.puts f
  end
end

# Read steg.png to be like "one_file" array
recov_file = File.read('steg.png').force_encoding("BINARY").split(sep).last
# Write sec_file to hola.pdf
File.open('hola.pdf', 'wb') {|file| file.print recov_file}
