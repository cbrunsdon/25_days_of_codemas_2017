steps = File.open('05.txt').map &:to_i

index = 0
puts number_steps = 0
while index < steps.count
  puts index
  new_index = index + steps[index]
  steps[index] = steps[index] + 1
  index = new_index
  number_steps = number_steps + 1
end
puts "First answer: #{number_steps}"
