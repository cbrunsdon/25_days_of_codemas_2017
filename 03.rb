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

class Grid
  attr_reader :rows, :size

  def initialize(size, previous_rows)
    @size = size
    @rows = previous_rows

    return if size == 1
    @rows = [Array.new(size)] + previous_rows.map do |row|
      row.unshift nil
      row << nil
      row = row.flatten
    end
    @rows << Array.new(Array.new(size))

    fill!
  end

  def print!
    rows.each do |row|
      puts row.join(" ")
    end
  end

  private

  def adjacents(x, y)
    [maybe_at(x - 1, y),
     maybe_at(x + 1, y),
     maybe_at(x, y + 1),
     maybe_at(x, y - 1),
     maybe_at(x - 1, y + 1),
     maybe_at(x - 1, y - 1),
     maybe_at(x + 1, y - 1),
     maybe_at(x + 1, y + 1)
    ]
  end

  def maybe_at(x,y)
    return nil if x < 0 or x > size - 1
    return nil if y < 0 or y > size - 1

    rows[x][y]
  end

  def fill!
    fill_order.each do |x, y|
      @rows[x][y] = adjacents(x,y).compact.sum
      if @rows[x][y] >= 312051
        puts @rows[x][y]
        raise "yea this is fine"
      end
    end
  end

  def fill_order
    steps = size - 1
    all_fill = (0..(steps - 1)).map do |step|
      [(size - step - 2), size - 1]
    end
    all_fill = all_fill +  (0..(steps - 1)).map do |step|
      [0, size - step - 2]
    end
    all_fill = all_fill +  (0..(steps - 1)).map do |step|
      [step + 1, 0]
    end
    all_fill + (0..(steps - 1)).map do |step|
      [size - 1, step + 1]
    end
  end
end

grid = Grid.new(1, [[1]])
while true
  grid = Grid.new(grid.size + 2, grid.rows)
  puts grid.print!
end
