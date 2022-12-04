#!/usr/bin/ruby
# 1 for Rock
# 2 for Paper
# 3 for Scissors

# 0 for loss
# 3 for Draw
# 6 for a win

file = File.open("puzzle_sample.txt")

@them = {'A' => 'Rock', 'B' => 'Paper', 'C' => 'Scissors'}
@mine = {Y: 'Paper', X: 'Rock', Z: 'Scissors'}
@score = 0

conditions = {
  "Rock" => "Scissors",
  "Paper" =>  "Rock",
  "Scissors" => "Paper"
}

puts "Them #{@them}"
puts "Mine #{@mine}"

def score_play(play)
  their_play = @them.hash[play.first]
  my_play = @mine.hash[play.last]
  puts "Them #{play.first}, #{their_play} vs me #{play.last}, #{my_play}"
end

file.each_line do |line|
  play = line.split(/ /)

  puts "Mine #{@mine.key(play.last)}"
  score_play(play)
end


