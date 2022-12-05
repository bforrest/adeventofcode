#!/usr/bin/ruby


def how_valuable(datum)
  puts "letter #{datum} value #{datum.ord}"
  return datum.ord.to_int - 96 if 97 <= datum.ord && datum.ord <= 122
  return datum.ord - 38 if 65 <= datum.ord  && datum.ord <= 90
end


lines = File.readlines("input.txt")
#puts lines
@counter = 1
@total = 0

while lines.length > 0
  puts "Pass # #{@counter}"
  @counter += 1

  group = lines.slice!(0,3)

  # puts "group of 3"
  # puts group

  first = group.first.chars
  middle = group[1].chars
  last = group.last.chars

  badge_match = first & middle & last

  puts "badge_match #{badge_match}"

  # puts "lines after slice!(3)"
  # puts lines
  @total += how_valuable(badge_match.first)
end

puts "Total #{@total}"
# file.lines.take(3)cl
#
