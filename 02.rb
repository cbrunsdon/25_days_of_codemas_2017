require 'csv'
require 'pry'
lines = CSV.open('02.txt', { :col_sep => "\t" }).map do |line|
  vals = line.map(&:to_i)
end

puts "Answer to first half:"
puts lines.map { |line| line.max - line.min }.sum

def even_divisors(line)
  line.sort.reverse.each do |num|
    (line - [num]).each do |test|
      if num % test == 0
        return num / test
      end
    end
  end
end

puts "Answer to second half:"
puts lines.map { |line| even_divisors(line) }.sum
