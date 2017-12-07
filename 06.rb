list = '4 10 4 1 8 4 9 14 5 1 14 15 0 15 3 5'.split(" ").map &:to_i

hashes = []

while !hashes.include? list.hash
  hashes.push list.hash
  rebalance_count = list.max
  to_rebalance = list.index rebalance_count

  list[to_rebalance] = 0

  while rebalance_count > 0
    rebalance_count = rebalance_count - 1
    to_rebalance = (to_rebalance + 1) % list.length
    list[to_rebalance] = list[to_rebalance] + 1

    break if hashes.include? list.hash
  end
end

puts "Balanced in: #{hashes.count}"
