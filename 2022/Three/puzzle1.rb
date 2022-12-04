#!/usr/bin/ruby

# In the above example, the priority of the item type that appears in both compartments
# of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s);
# the sum of these is 157.
# Lowercase item types a through z have priorities 1 through 26.
# lower ascii 97 - 122
# 97::1, 98::2 (add 96)
# Uppercase item types A through Z have priorities 27 through 52.
# upper ascii 65 - 90 (subtract 38)
# 65::27, 66::28

file = File.open("input.txt")

def how_valuable(datum)
  puts "letter #{datum} value #{datum.ord}"
  return datum.ord.to_int - 96 if 97 <= datum.ord && datum.ord <= 122
  return datum.ord - 38 if 65 <= datum.ord  && datum.ord <= 90
end


@total = 0
file.readlines(&:strip).each_entry do |entry|
  first,second = entry.partition(/.{#{entry.size/2}}/)[1,2]

  common = first.chars & second.chars

  #puts "common #{common[0]} #{common[0].ord}"
  #output = how_valuable(common[0])
  #puts "Priority value #{output}"
  @total += how_valuable(common.first)
end

puts "Total: #{@total}"
