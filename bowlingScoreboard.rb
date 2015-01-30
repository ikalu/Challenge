class Scoreboard
  attr_reader :rolls

  def initialize(pins)
    @rolls = pins.split(" ")
  end

  def check_roll(index, roll)
    @pins_knocked_down += roll.to_i
    print roll.to_i if @pins_knocked_down < 10
    @toss += 1
    print "X" if (@toss == 1 and @pins_knocked_down == 10)
    print "/" if (@toss == 2 and @pins_knocked_down == 10)
    print "\t" if @toss == 1
    special_frame(index)
    if (@toss == 2 or @pins_knocked_down == 10)
      next_frame(index) if @current_frame != 10
    end
  end

  def next_frame(index)
    @frame_score[@current_frame] = @frame_score[@current_frame - 1] + @pins_knocked_down + extra_frame(index)
    print "\t\t#{@frame_score[@current_frame]}"
    puts
    @toss = 0
    @current_frame += 1
    print "#{@current_frame}\t"
    @pins_knocked_down = 0
  end

  def special_frame(index)
    return if @current_frame != 10
    print "\t#{rolls[index + 1]}" if @toss == 2 and @current_frame == 10 and @pins_knocked_down == 10
    print "#{rolls[index + 1]}\t#{rolls[index + 2]}\t" if @toss == 1 and @current_frame == 10
    @frame_score[@current_frame] = @frame_score[@current_frame - 1] + @pins_knocked_down + extra_frame(index)
    puts @frame_score[@current_frame]
    exit
  end

  def extra_frame(index)
    points = 0
    if @pins_knocked_down == 10 
      points += rolls[index + 1].to_i
      if @toss == 1
        points += rolls[index + 2].to_i
      end
    end
    points
  end

  def score_game
    @frame_score = { 0 => 0}
    @current_frame = 1
    @toss = 0
    @pins_knocked_down = 0

    puts "FR\tT1\tT2\tT3\tScore"
    print "#{@current_frame}\t"

    rolls.each_index do |index|
      check_roll(index, rolls[index])
    end
  end
end

pins = "8 1 10 5 5 8 0 10 10 9 1 8 1 9 1 10 7 2"
bowling_scoreboard = Scoreboard.new(pins)
bowling_scoreboard.score_game
