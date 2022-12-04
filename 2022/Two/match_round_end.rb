#!/usr/bin/ruby
# 1 for Rock
# 2 for Paper
# 3 for Scissors

# 0 for loss
# 3 for Draw
# 6 for a win

#file = File.open("puzzle_sample.txt")
file = File.open("puzzle_input.txt")

@them = {A: 'Rock', B: 'Paper', C: 'Scissors'}
@mine = {Y: 'Draw', X: 'Loose', Z: 'Win'}
@points = {'Rock' => 1, 'Paper' => 2, 'Scissors' => 3}

@score = 0

@conditions = {
  "Rock" => "Scissors",
  "Paper" =>  "Rock",
  "Scissors" => "Paper"
}


def outcome(me, them)
  puts "me == them #{me == them}"
  puts "me == condition #{them == @conditions.key(me)}"

  return 3 if me == them
  return 6 if me ==  @conditions.key(them)
  return 0
end

def winner(me, them)
  return 'draw' if me == them
  return 'me' if me == @conditions.key(them)
  return 'them'
end

def what_to_play(opponent_throw, expected_outcome)
  puts " #{opponent_throw} Putting #{expected_outcome} == 'Draw' #{expected_outcome.to_s == 'Draw'}"
  #puts "conditions[] #{@conditions[opponent_throw]}"
  #puts "conditions.key #{@conditions.key(opponent_throw)}"
  return opponent_throw if expected_outcome.to_s == 'Draw'
  return @conditions.key(opponent_throw) if expected_outcome.to_s == 'Win'
  return @conditions[opponent_throw]
end

def score_play(opponent, desired_outcome)
  their_play = @them[opponent]
  round_end = @mine[desired_outcome]

  puts "Desired outcome #{round_end} opponent threw #{their_play}"
  my_play = what_to_play(their_play, round_end)
  puts "my play: #{my_play}"
  puts "Them #{opponent}, #{their_play} vs me #{desired_outcome}, #{my_play} => Winner: #{winner(my_play, their_play)}"

  points_for_throw = @points[my_play] # points for the 'throw'
  points_for_outcome = outcome(my_play, their_play)

  round_total = points_for_outcome + points_for_throw

  puts "Throw #{points_for_throw} OutCome #{points_for_outcome} Total => #{round_total}"
  @score += round_total
end

file.each_line do |line|
  play = line.strip.split(/ /) #strip, then split took way too long to figure out.
  score_play(play.first.to_sym, play.last.to_sym)
end

# 11199 is too low
# 13830 is too high
puts "My score: #{@score}"
