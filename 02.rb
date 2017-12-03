require 'csv'
require 'pry'
checksums = CSV.open('02.txt', { :col_sep => "\t" }).map do |line|
  vals = line.map(&:to_i)
  vals.max - vals.min
end


puts checksums.sum
