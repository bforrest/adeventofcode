#!/usr/bin/ruby
# frozen_string_literal: true

# Sample stack
#     [D]
# [N] [C]
# [Z] [M] [P]
#  1   2   3
# @stacks = {}
# @stacks[1] = ['Z', 'N']
# @stacks[2] = ['M', 'C', 'D']
# @stacks[3] = ['P']

# sample moves
# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2

# Finished: {1=>["C"], 2=>["M"], 3=>["P", "D", "N", "Z"]}

# Challenge starting containers
#             [Q]     [G]     [M]
#             [B] [S] [V]     [P] [R]
#     [T]     [C] [F] [L]     [V] [N]
# [Q] [P]     [H] [N] [S]     [W] [C]
# [F] [G] [B] [J] [B] [N]     [Z] [L]
# [L] [Q] [Q] [Z] [M] [Q] [F] [G] [D]
# [S] [Z] [M] [G] [H] [C] [C] [H] [Z]
# [R] [N] [S] [T] [P] [P] [W] [Q] [G]
#  1   2   3   4   5   6   7   8   9

@stacks = {}
@stacks[1] = %w[R S L F Q]
@stacks[2] = %w[N Z Q G P T]
@stacks[3] = %w[S M Q B]
@stacks[4] = %w[T G Z J H C B Q]
@stacks[5] = %w[P H M B N F S]
@stacks[6] = %w[P C Q N S L V G]
@stacks[7] = %w[W C F]
@stacks[8] = %w[Q H G Z W V P M]
@stacks[9] = %w[G Z D L C N R]

puts "stacks: #{@stacks}"
file = File.open('input.txt')
file.each_line do |line|
  puts line
  command = line.strip.split

  # 1 is how many containers to pop
  # 3 is where to take them from
  # 5 is where to place them

  num_containers = command[1].to_i
  source = command[3].to_i
  dest = command[5].to_i

  #puts "How many? #{num_containers}"
  #puts "source: #{source} => #{@stacks[source]}" if num_containers > 10
  #puts "destination: #{dest} #{@stacks[dest]}" if num_containers > 10

  while num_containers >= 1
    @stacks[dest].push(@stacks[source].pop)
    num_containers -= 1
    #puts "num_containers: #{num_containers}"
  end

  puts "source: #{source} => #{@stacks[source]}" if num_containers > 10
  puts "destination: #{dest} #{@stacks[dest]}" if num_containers > 10
end

puts "Finished: #{@stacks}"

@tops = []
@stacks.each_entry do |k, v|
  @tops << @stacks[k].last
end

# RNSTPGWQR was incorrect as was
# QTBQSPFMG
# QTBQSGFMR

puts "Top containsers: #{@tops.join}"
