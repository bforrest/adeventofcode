#!/usr/bin/ruby

file = File.open("input.txt")

@covered_count = 0
@covered_left = 0
@covered_right = 0
@result = []

file.each_line do |line|
  pairs = line.strip.split(/,/)
  elf_pair = []
  pairs.each_entry do |entry|
    limits = entry.split(/-/)
                  .map(&:to_i)
    elf_pair << Range.new(limits.first, limits.last)
  end

  # if the start or end of the other range is included in the first range, there is overlap
  left =  elf_pair.first.cover?(elf_pair.last.first) || elf_pair.first.cover?(elf_pair.last.last)

  # if the start or end of the other range is included in the second range, there is overlap
  right = elf_pair.last.cover?(elf_pair.first.first) || elf_pair.last.cover?(elf_pair.first.last)

  covered = left or right

  #puts "#{pairs} | left #{left} | right #{right}"
  @result << "#{elf_pair.first} <==> #{elf_pair.last} | left #{left} | right #{right}"

  @covered_count += 1 if left || right
  @covered_left += 1 if left
  @covered_right += 1 if right
end

# 422 is too low
puts "covered count = #{@covered_count}"
puts "left #{@covered_left}"
puts "right #{@covered_right}"

File.open("covered.txt", "w") { |f| f.write @result.join("\n"), mode: "a" }
