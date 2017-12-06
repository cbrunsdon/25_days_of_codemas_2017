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

index = 0
puts number_steps = 0
steps = File.open('05.txt').map &:to_i
while index < steps.count
  puts index
  new_index = index + steps[index]
  if steps[index] < 3
    steps[index] = steps[index] + 1
  else
    steps[index] = steps[index] - 1
  end
  index = new_index
  number_steps = number_steps + 1
end
puts "Second answer: #{number_steps}"
