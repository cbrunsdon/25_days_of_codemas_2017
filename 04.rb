valid_lines = File.open('04.txt', 'r').select do |line|
  line.split(" ").count == line.split(" ").uniq.count
end

puts "There are #{valid_lines.count} valid lines"

valid_lines = File.open('04.txt', 'r').select do |line|
  line = line.split(" ").map { |y| y.chars.sort }
  line.count == line.uniq.count
end
puts "There are #{valid_lines.count} valid with anagrams"
