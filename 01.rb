input = ARGV[0]

string = input + input[0]
total = (0..input.length).sum do |i|
  string[i] == string[i+1] ? string[i].to_i : 0
end
puts "Answer 1st part: "
puts total

puts "Answer 2nd part: "
total = (0..input.length).sum do |i|
  half = (i + (input.length / 2)) % input.length
  input[i] == input[half] ? input[i].to_i : 0
end
puts total
