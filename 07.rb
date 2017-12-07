graph = File.open('07.txt').map do |line|
  match = line.match('([a-z]*)\s*\((\d*)\)(.*)')

  name, weight, rest = match[1], match[2], match[3]
  rest.slice!(' -> ')
  deps = rest.split(', ')

  [name, weight, deps]
end

# trim out any not holing up something
not_empty = graph.select { |_, _, deps| !deps.empty? }

root_node = not_empty.detect do |name, _, _|
  not_empty.none? { |_, _, deps| deps.include?(name) }
end

puts "Answer is: #{root_node.inspect}"
