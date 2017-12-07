graph = File.open('07.txt').map do |line|
  match = line.match('([a-z]*)\s*\((\d*)\)(.*)')

  name, weight, rest = match[1], match[2].to_i, match[3]
  rest.slice!(' -> ')
  deps = rest.split(', ')

  [name, weight, deps]
end

def find_node(graph, node_name)
  graph.detect { |name, _, _| name == node_name }
end

def weight(graph, node_name)
  node = find_node(graph, node_name)
  node[1] + node[2].map { |dep| weight(graph, dep) }.sum
end

# trim out any not holing up something
not_empty = graph.select { |_, _, deps| !deps.empty? }

root_node = not_empty.detect do |name, _, _|
  not_empty.none? { |_, _, deps| deps.include?(name) }
end

puts "Answer is: #{root_node.inspect}"

unbalanced = not_empty.select { |_, _, deps|
  deps.map { |y| weight(graph, y) }.uniq.count > 1
}

# find the unbalanced without any deps
require 'pry'
binding.pry
candidates = unbalanced.map &:first
unbalanced = unbalanced.detect { |_, _, deps| !deps.any? { |y| candidates.include? y } }

puts "Node #{unbalanced[0]} is unbalanced "
dep_weights = unbalanced[2].map do |dep|
  puts "#{dep}: #{weight(graph, dep)}"
  [dep, weight(graph, dep)]
end

dep_weights = dep_weights.sort_by { |_, weight| weight }
diff = dep_weights.last[1] - dep_weights.first[1]
wrong_node = find_node(graph, dep_weights.last[0])

puts "Wrong node is: #{wrong_node.inspect}"
puts "Difference is: #{diff}"
puts "Weight is: #{wrong_node[1]}"
puts "Answer is: #{wrong_node[1] - diff}"
