#!/usr/bin/ruby

file = File.open("d1p1_input.txt")
#file = File.open("d1p1_sample.txt")
@elves = []
@index = 1
@accumulator = 0
Elf = Struct.new(:name, :calories)
def push_elf(accumulator, elves, index)
  puts "Elf ${index} calories: #{accumulator}"
  elves << Elf.new(index, accumulator)
  @index += 1
  @accumulator = 0
end

file.each_line do |line|
  push_elf(@accumulator, @elves, @index) if line.chomp.empty?
  @accumulator += line.to_i unless line.nil?
end

most = @elves.sort_by {|elf|[elf.calories]}.reverse.slice(0,3)
puts most
puts most.slice(0,3).sum(&:calories)
