def find_closest_square num
  i = 1
  while num > (i * i)
    i = i + 2
  end
  i
end

def position_from_sets(sets, square, input)
  if sets[0].include? input
    [(square - 1), ((square - 1) -  sets[0].index(input)) - 1]
  elsif sets[1].include? input
    [((square - 1) -  sets[1].index(input)) - 1, 0]
  elsif sets[2].include? input
    [0, sets[2].index(input)]
  else
    [sets[3].index(input) + 1, square - 1]
  end
end

input = 312051
square = find_closest_square(input)
start_num = (square - 2) * (square - 2) + 1
finish_num = square * square

outer_edge = (start_num..finish_num).to_a
sets = outer_edge.each_slice((outer_edge.length / 4)).to_a
pair = position_from_sets(sets, square, input)

center = (square - 1) / 2
steps = (pair[0] - center).abs + (pair[1] - center).abs

puts "Answer is: #{steps}"
