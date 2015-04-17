#!/bin/env ruby
chars = ["A","C","G","T"]
seq = File.read(ARGV[0]).strip
result = seq.chars.reduce({}) do |r,c|
  r.merge({ c.upcase => (r[c.upcase]||0)+1})
end
puts chars.map{|c| result[c]}.join(" ")
