input = ARGV[0]

string = input + input[0]
total = (0..input.length).sum do |i|
  string[i] == string[i+1] ? string[i].to_i : 0
end
puts "Answer: "
puts total
